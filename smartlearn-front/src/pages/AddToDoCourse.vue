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
                    <b-icon><i class="fa-solid fa-align-left"></i></b-icon>
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
                  <strong>set prize</strong>
                </div>
                <b-input-group size="mb" class="mb-5">
                  <b-input-group-prepend is-text>
                    <b-icon><i class="fa-brands fa-ethereum"></i></b-icon>
                  </b-input-group-prepend>
                  <b-form-input
                    v-b-popover.hover.bottom="
                      'The minimum prize must be greater than 0.1 eth (not equal)'
                    "
                    id="datepicker-valid"
                    v-model="prize"
                    :state="prize >= 0.1"
                    class="mb-2"
                    placeholder="prize amount"
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
              <b-button type="submit" variant="outline-warning"
                >Add &nbsp;
                <b-icon><i class="fa-solid fa-indent"></i></b-icon>
              </b-button>
            </b-row>
          </b-col>
          <b-col xl="4"></b-col>
        </b-row>
      </b-form>
    </b-col>

    <b-col xl="4"> 
        <div class=" bg-info bg-gradient text-light text-center rounded-3 p-5">fgdfgdf
        </div>
    </b-col>
    </b-row>
  </div>

  <div v-else>
    <p>Loading...</p>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import moment from "moment";

const args = {
  contractName: "SmartLearn",
  method: "add",
  methodArgs: ["_description", "_deadline"],
};

export default {
  name: "AddCourseForm",
  components: {},
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    ...mapGetters("accounts", ["activeAccount", "activeBalance"]),
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
.titleBox {
  font-family: "Comic sans MS", 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-size: 20px;
  color: rgb(45, 29, 189);
}
</style>
