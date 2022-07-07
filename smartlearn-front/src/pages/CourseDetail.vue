<template>
  <div class="container">
    <b-row>
      <b-col xl="">
        <b-embed
          type="iframe"
          width="640"
          height="360"
          :src="`https://www.youtube.com/embed/${course.video}`"
          allowfullscreen
        ></b-embed>
      </b-col>
      <b-col class="text-center">
        <b-button
          id="show-btn"
          @click="$bvModal.show('modal-scoped')"
          variant="outline-warning"
        >
          Add this course to Course To Do
        </b-button>

        <b-modal style="background-color:black;" id="modal-scoped" hide-footer>
          <template #modal-header="{ }">
            Fill this to Add
            <!-- <b-button size="sm" variant="outline-danger" @click="close()">
        Close Modal
      </b-button> -->
          </template>
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
                        <strong>set prize</strong>
                      </div>
                      <b-input-group size="mb" class="mb-2">
                        <b-input-group-prepend is-text>
                          <b-icon><i class="fa-brands fa-ethereum"></i></b-icon>
                        </b-input-group-prepend>
                        <b-form-input
                          v-b-popover.hover.right="
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
                        <b-icon><i class="fa-solid fa-indent"></i></b-icon>
                      </b-button>
                    </b-row>
                  </b-col>
                  <b-col xl="4"></b-col>
                </b-row> -->

                <b-button
                  class="mt-3"
                  @click="$bvModal.hide('bv-modal-example')"
                  type="submit"
                  block
                  >Add</b-button
                >
              </b-form>
            </div>

            <div v-else>
              <p>Loading...</p>
            </div>
          </div>
        </b-modal>
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        {{ course.name }}
        {{ course.description }}
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
