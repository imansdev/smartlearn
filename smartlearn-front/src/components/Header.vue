<template>
  <b-navbar toggleable="sm" type="light" variant="" class="imanlg mt-lg-3">
    <div class="container" style="min-height: 10vh">
      <b-navbar-brand>
        <img
          src="../assets/logo.png"
          width="50"
          height="50"
          class="d-inline-block"
          alt="smartlearn"
        />
        <b class="subtitle"><strong class="mt-lg-5">martlearn</strong> </b>
      </b-navbar-brand>

      <b-collapse id="navbar-toggle-collapse" is-nav>
        <b-navbar-nav class="ml-auto">
          <b-nav-item><router-link :to="'home'">Home</router-link></b-nav-item>
          <b-nav-item
            ><router-link :to="'contact'"
              >Conttact to US</router-link
            ></b-nav-item
          >
          <b-nav-item><router-link :to="'yyy'">detail</router-link></b-nav-item>
        </b-navbar-nav>
      </b-collapse>
      <div right>
        <b-button v-b-toggle.sidebar-no-header>Any offer ?</b-button>
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
                  <b-button pill variant="outline-secondary" @click="hide">
                    exit
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

export default {
  data() {
    return {
      message: "",
    };
  },
  methods: {
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
  },
};
</script>

<style>
.imanlg {
  box-shadow: -0px 0px 3px #f5aa45;
}
</style>
