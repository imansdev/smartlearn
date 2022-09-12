<template>
  <div v-if="isDrizzleInitialized" class="container py-1">
    <b-row>
      <b-col xl="8">
        <b-form inline class="row" @submit.prevent="onSubmit">
          <div class="pb-3">
            <b-row>
              <b-col class="pb-3" xl="6">
                <div class="pb-4">
                  <div class="pb-3  titleBox">
                    <strong>describe your course</strong>
                  </div>
                  <b-input-group size="mb" class="mb-3">
                    <b-input-group-prepend is-text>
                      <span class="iconHeight"
                        ><i class="fa-solid fa-align-left"></i
                      ></span>
                    </b-input-group-prepend>
                    <b-form-input
                      v-model="description"
                      class="mb-2"
                      placeholder="Course Description"
                    ></b-form-input>
                  </b-input-group>
                </div>
                <div>
                  <div class="pb-3  titleBox">
                    <strong
                      v-b-popover.hover.right="
                        'Each course you add has a wage of 0.1 ETH'
                      "
                      >set prize (+0.1 wage)</strong
                    >
                  </div>
                  <b-input-group size="mb" class="mb-2">
                    <b-input-group-prepend is-text>
                      <span class="iconHeight"
                        ><i class="fa-brands fa-ethereum"></i
                      ></span>
                    </b-input-group-prepend>
                    <b-form-input
                      v-b-popover.hover.right="
                        'The minimum prize must be greater than 0.1 ETH (not equal)'
                      "
                      id="datepicker-valid"
                      v-model="prize"
                      :state="prize >= 0.1"
                      class="mb-2"
                      placeholder="Prize amount in ETH"
                      type="text"
                    ></b-form-input>
                  </b-input-group>
                </div>
              </b-col>
              <b-col class="pt-5" xl="6">
                <div class="pb-3 titleBox">
                  <strong>set deadline</strong>
                </div>
                <div>
                  <b-form-input
                    type="date"
                    v-model="date"
                    class="mb-2"
                  ></b-form-input>
                </div>
                <div>
                  <b-form-input
                    type="time"
                    v-model="time"
                    class="mb-2"
                  ></b-form-input>
                </div>
              </b-col>
            </b-row>
            <b-row>
              <b-col xl="6">
                <strong>Do you want to encourage someone else ?</strong>
                <p>
                  you can choose this option and set their address wallet
                </p>
              </b-col>
              <b-col xl="6">
                <strong>Do you want to punish yourself ?!</strong>
                <p>
                  you can choose this option and when your course deadline is
                  over, your course prize will be transfer to us
                </p>
                <p class="textSiteThanks">
                  thank you in advance for your participation
                  <i class="fa-regular fa-face-kiss-wink-heart"></i>
                </p>
              </b-col>
            </b-row>

            <b-row>
              <b-col class="pb-4" xl="6">
                <div>
                  <b-form-checkbox
                    size="lg"
                    v-model="toAnother"
                    name="check-another-wallet"
                    switch
                  >
                    &nbsp;&nbsp;toAnother
                  </b-form-checkbox>
                </div></b-col
              >

              <b-col class="pb-4" xl="6">
                <div>
                  <b-form-checkbox
                    size="lg"
                    v-model="punishMe"
                    name="check-punish"
                    switch
                  >
                    &nbsp;&nbsp;punishMe
                  </b-form-checkbox>
                </div>
              </b-col>
            </b-row>
            <b-row>
              <div v-if="toAnother === true">
                <b-form-input
                  v-b-popover.hover.top="''"
                  v-model="anotherWallet"
                  :state="anotherWallet.length == '42'"
                  class="mb-2"
                  placeholder="another address"
                  style="width: 458px; height: 30px;"
                ></b-form-input>
              </div>
              <div v-else>{{ defaultAddress() }}</div>
            </b-row>
          </div>
          <b-row>
            <b-col xl="4"></b-col>
            <b-col xl="4">
              <b-row>
                <b-button type="submit" variant="outline-dark"
                  >Add &nbsp;
                  <i class="fa-solid fa-indent"></i>
                </b-button>
              </b-row>
            </b-col>
            <b-col xl="4"></b-col>
          </b-row>
        </b-form>
      </b-col>
      <b-col xl="4">
        <div class=" bgleftbox bg-gradient text-light rounded-3 p-3">
          <TotalUserToSite />
        </div>
      </b-col>
    </b-row>
  </div>
  <div v-else>
    <strong style="color: #fcd200da;text-align: center;">
      <p>
        Is
        <a href="https://metamask.io/" target="_blank">MetaMask</a>
        extension installed on your browser?
      </p>
      <p>
        Is proper network selected in MetaMask?
      </p>
      <p>(Rinkeby Test Network or Localhost on port 8545)</p>
    </strong>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import moment from "moment";
import TotalUserToSite from "../components/totalUserToSite.vue";

const args = {
  contractName: "SmartLearn",
  method: "add",
  methodArgs: ["_description", "_deadline"],
};

export default {
  name: "AddCourseToDo",
  components: {
    TotalUserToSite,
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    ...mapGetters("accounts", ["activeAccount"]),
  },
  methods: {
    defaultAddress() {
      this.anotherWallet = "0x0000000000000000000000000000000000000000";
    },
    onSubmit() {
      let timestamp = 0;
      if (
        this.date != "" &&
        this.time != "" &&
        this.prize >= 0.1 &&
        this.description.length >= 1
      ) {
        let datetimeString = this.date + " " + this.time;
        timestamp = moment(datetimeString, "YYYY-MM-DD HH:mm").unix();

        this.drizzleInstance.contracts[args.contractName].methods[
          args.method
        ].cacheSend(
          this.description,
          timestamp,
          this.anotherWallet,
          this.punishMe,
          this.toAnother,
          {
            from: this.activeAccount,
            value: this.drizzleInstance.web3.utils.toWei(this.prize, "ether"),
          }
        );
      }
    },
  },
  data: () => ({
    prize: "",
    description: "",
    date: "",
    time: "",
    anotherWallet: "0x0000000000000000000000000000000000000000",
    toAnother: false,
    punishMe: false,
  }),
};
</script>

<style>
.iconHeight {
  min-height: auto;
}
.textSiteThanks {
  color: #fcd200da;
}
.bgleftbox {
  background: #fcd200da;
}
.titleBox {
  font-family: "Comic sans MS", "Avenir", Helvetica, Arial, sans-serif;
  /* -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale; */
  font-size: 20px;
  color: #fcd200da;
}
</style>
