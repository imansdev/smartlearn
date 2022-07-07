<template>
  <b-navbar class="bgHeaderb">
    <div class="  container" style="min-height: 10vh">
      <!-- <b-navbar-brand>
        <img src="../assets/logo.png" width="45" height="45" alt="smartlearn" />
      </b-navbar-brand> -->
      <!-- <b class="ssize"><strong class="mt-lg-5 ">s</strong></b> -->
      <b-button id="hkh" tag="router-link" to="/home" variant="outline">
        <p class="ssize">s</p>
        <b class="subtitle bgtitle"
          ><strong> martlearn</strong>
        </b></b-button
      >

      <b-collapse id="navbar-toggle-collapse" is-nav>
        <b-navbar-nav class="ml-auto">
          <b-nav-item
            ><b-button tag="router-link" to="/courses" variant="outline">
              <b class="colorall">Courses</b>
            </b-button></b-nav-item
          >
          <b-nav-item>
            <b-button tag="router-link" to="/add" variant="outline"
              ><b class="colorall">Add To Do</b>
            </b-button>
          </b-nav-item>
          <b-nav-item>
            <b-button tag="router-link" to="/todo" variant="outline"
              ><b class="colorall">Course To Do</b>
            </b-button>
          </b-nav-item>
        </b-navbar-nav>
      </b-collapse>
      <div>
        <b-input-group class="hjl">
          <b-input-group-prepend>
            <b-button @click.prevent="onSubmit" variant="outline-dark">
              <b class="coloric"
                ><i class="fa-brands fa-ethereum"></i></b
            ></b-button>
          </b-input-group-prepend>
          <b-form-input
            @keyup.enter="onSubmit"
            id="rcorners"
            v-model="donateAmount"
            placeholder="Donate amount in ether"
            type="text"
          ></b-form-input>
        </b-input-group>
      </div>
      <div right>
        <b-button v-b-toggle.sidebar-no-header variant="outline-dark hhk">
          <b class="coloroffer">Any Offer ?</b></b-button
        >
        <b-sidebar
          id="sidebar-no-header"
          aria-labelledby="sidebar-no-header-title"
          no-header
          right
          shadow
        >
          <template #default="{ hide }">
            <b-form ref="form" @submit.prevent="sendEmail">
              <div class="px-3">
                <div class="py-1">
                  <b-button pill @click="hide">
                    <i class="fa-regular fa-circle-xmark"></i>
                  </b-button>
                </div>
                <div class="py-1">
                  <p>
                    If you have any offer to improve this site please tell us
                  </p>
                  <label><strong>your offer</strong> </label>
                </div>
                <div class="py-1">
                  <b-form-textarea
                    id="textarea-state"
                    name="message"
                    v-model="message"
                    :state="message.length >= 10"
                    placeholder="Your message must contain at least 10 characters"
                    cols="30"
                    rows="20"
                  ></b-form-textarea>
                </div>
                <div class="text-center py-4">
                  <b-button
                    size="lg"
                    block
                    variant="primary"
                    @click="hide"
                    type="submit"
                    value="Send"
                    >send</b-button
                  >
                </div>
              </div>
            </b-form>
          </template>
        </b-sidebar>
      </div>
    </div>
  </b-navbar>
</template>

<script>
import emailjs from "@emailjs/browser";
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance"]),
    ...mapGetters("accounts", ["activeAccount"]),
  },
  data() {
    return {
      message: "",
      donateAmount: "",
      isHome: false,
    };
  },
  methods: {
    onSubmit() {
      this.drizzleInstance.contracts["SmartLearn"].methods["donate"].cacheSend({
        from: this.activeAccount,
        value: this.drizzleInstance.web3.utils.toWei(
          this.donateAmount,
          "ether"
        ),
      });
    },
    sendEmail() {
      if (this.message.length >= 10) {
        emailjs.sendForm(
          "service_9sjxu8w",
          "template_cut3mh7",
          this.$refs.form,
          "Hmqsuup3nMwM_91eK"
        );
      }
    },
    setIsHome() {
      let url = this.$router.history.current.path;
      // eslint-disable-next-line no-console
      console.log({ url });
      this.isHome = ["/home"].includes(url);
    },
  },
  watch: {
    $route() {
      this.setIsHome();
    },
  },
  created() {
    this.setIsHome();
  },
};
</script>

<style>
#hkh {
  display: flex;
}
#rcorners {
  border-radius: 4px;
  border: 1px solid black;
  padding: 18px;
  width: 212px;
  height: 0px;
  box-shadow: inset 0 0 8px black, inset 0 0 8px black;
}
.around {
  width: 100%;
  height: 38px;
  /* background-color: rgba(25, 208, 16, 0.894); */
  border: black #101110;
  /* border-width: 10px 0; */
}
.hjl {
  text-align: center;
  padding-right: 50px;
}
.bgtitle {
  padding-top: 27px;
  /* padding-left: -100em; */
  color: white;
  /* margin-left: -15px; */
  padding-right: 50px;
}
.colorall {
  color: white;
}
.bgHeader {
  background-color: white;
}
.bgHeaderb {
  background-color: black;
}
.hhk {
  color: #f5aa45;
}
.coloric {
  color: #fcd200da;
}
.imanlg {
  box-shadow: -0px 0px 3px #f5aa45;
}
.coloroffer {
  color: #fcd200da;
}
.ssize {
  color: #fcd200da;
  font-size: 40px;
  margin-left: -50px;
}
</style>
