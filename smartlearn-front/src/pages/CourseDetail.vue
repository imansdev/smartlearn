<template>
  <div class="container">
    <b-row>
      <b-col>
        <b-row>
          <b-embed
            type="iframe"
            width="640"
            height="360"
            :src="`https://www.youtube.com/embed/${course.video}`"
            allowfullscreen
          ></b-embed>
        </b-row>
        <b-row>
          <strong
            ><p
              style="text-shadow: 0 0 3px black; font-size: 30px; color:#fcd200da;"
              class="pt-3"
            >
              Wellcome
            </p></strong
          >
          <p style="font-size: 20px;">{{ course.description }}</p></b-row
        >
        <!-- <iframe width="853" height="480" src="https://www.youtube.com/embed/P6N9782MzFQ" frameborder="0" allowfullscreen ng-show="showvideo"></iframe> -->
      </b-col>
      <b-col>
        <b-row>
          <b-button
            id="show-btn"
            @click="$bvModal.show('modal-scoped')"
            variant="outline-warning"
          >
            Add this course to Course To Do
          </b-button>

          <b-modal
            header-class="modalHeader"
            content-class="modalContent"
            id="modal-scoped"
            hide-footer
          >
            <template #modal-header>
              <div style="font-size:30px;">
                FILL UP
              </div>
            </template>
            <template #default>
              <div class="d-block text-center">
                <div v-if="isDrizzleInitialized" class="container py-1">
                  <b-form inline class="row" @submit.prevent="onSubmit">
                    <div class="pb-3">
                      <!-- <b-row>
                    <b-col xl="6">
                      <strong>Do you want to encourage someone else ?</strong>
                      <p>
                        you can choose this option and set their address wallet
                      </p>
                    </b-col>
                    <b-col xl="6">
                      <strong>Do you want to punish yourself ?!</strong>
                      <p>
                        you can choose this option and when your course deadline
                        is over, your course prize will be transfer to us
                      </p>
                      <p class="textSiteThanks">
                        thank you in advance for your participation
                        <i class="fa-regular fa-face-kiss-wink-heart"></i>
                      </p>
                    </b-col>
                  </b-row> -->
                      <b-row>
                        <div>
                          <div class="pb-3  titleBox">
                            <strong
                              v-b-popover.hover.top="
                                'Each course you add has a wage of 0.1 ETH'
                              "
                              >set prize (+0.1 wage)</strong
                            >
                          </div>
                          <b-input-group size="mb" class="mb-2">
                            <b-input-group-prepend is-text>
                              <span class="iconHeightt"
                                ><i class="fa-brands fa-ethereum"></i
                              ></span>
                            </b-input-group-prepend>
                            <b-form-input
                              v-b-popover.hover.right="
                                'The minimum prize must be greater than 0.1 eth (not equal)'
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
                    <!-- <b-row>
                  <b-col xl="4"></b-col>
                  <b-col xl="4">
                    <b-row>
                      <b-button type="submit" variant="outline-dark"
                        >Add &nbsp;

                      </b-button>
                    </b-row>
                  </b-col>
                  <b-col xl="4"></b-col>
                </b-row> -->

                    <b-button
                      class="mt-3"
                      @click="$bvModal.hide('modal-scoped')"
                      type="submit"
                      variant="outline-warning"
                      block
                      >Add</b-button
                    >
                  </b-form>
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
              </div>
            </template>
          </b-modal>
        </b-row>
        <b-row>
          <strong
            ><p style="color:#fcd200da" class="pt-3">
              <i class="fa-solid fa-angles-right"></i>
              {{ course.name }}
            </p></strong
          >
          <strong
            ><p style="color:#fcd200da" class="pt-3">
              <i class="fa-solid fa-angles-right"></i>
              {{ course.deadline }} WEEKS
            </p></strong
          >
          <strong
            ><p style="color:#fcd200da" class="pt-3">
              <i class="fa-solid fa-angles-right"></i>
              {{ course.languageTo }}
            </p></strong
          >
        </b-row>
        <b-row> </b-row>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import axios from "axios";

const args = {
  contractName: "SmartLearn",
  method: "add",
  methodArgs: [],
};

export default {
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    ...mapGetters("accounts", ["activeAccount"]),
  },
  data() {
    return {
      courseId: this.$route.params.id,
      course: {},
      prize: "",
      anotherWallet: "0x0000000000000000000000000000000000000000",
      toAnother: false,
      punishMe: false,
      // description: "",
      // time: "",
    };
  },
  methods: {
    defaultAddress() {
      this.anotherWallet = "0x0000000000000000000000000000000000000000";
    },
    onSubmit() {
      if (this.prize >= 0.1) {
        let j = new Date().getTime() % 1000;
        let t = new Date().getTime() / 1000;
        j = j / 1000;
        t = t - j;
        let timestapm = t + this.course.deadline * 604800;
        // eslint-disable-next-line no-console
        console.log(
          this.course.name,
          timestapm,
          this.anotherWallet,
          this.punishMe,
          this.toAnother,
          this.prize
        );
        this.drizzleInstance.contracts[args.contractName].methods[
          args.method
        ].cacheSend(
          this.course.name,
          timestapm,
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
    // navigateToHome() {
    //   this.$router.push({ path: "/" });
    // },
  },
  async created() {
    try {
      const response = await axios.get(
        `http://127.0.0.1:8000/api/v1/courses/${this.courseId}`
      );
      this.course = response.data;
    } catch (e) {
      this.errors.push(e);
    }
  },
};
</script>
<style scoped>
.iconHeightt {
  min-height: auto;
}

::v-deep .modalHeader > {
  background: black;
  color: #fcd200da;
}
::v-deep .modalContent {
  background: black;
  color: #fcd200da;
}
</style>
<!-- <style>
.lesson-content {
  max-width: 640px !important;
}
.lesson-content .video-wrapper {
  position: relative;
  max-width: 640px;
  margin: 0 auto;
  padding-bottom: calc(9 / 16 * 100%);
  margin-bottom: 1em;
}
.lesson-content .video {
  position: absolute;
  left: 0;
  right: 0;
  width: 100%;
  height: 100%;
} -->
