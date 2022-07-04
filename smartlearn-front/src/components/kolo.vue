<template>
<div>
  <div>{{g}}</div>
    <b-form @submit.prevent="orderCourse">
      <div>
        <b-form-textarea
          id="textarea-state"
          v-model="linkT"
          placeholder="Note Content..."
          cols="2"
          rows="2"
        ></b-form-textarea>
      </div>
      <div>
        <b-form-textarea
          id="textarea-state"
          v-model="langF"
          placeholder="Note Content..."
          cols="2"
          rows="2"
        ></b-form-textarea>
      </div>
      <div>
        <b-form-textarea
          id="textarea-state"
          v-model="langT"
          placeholder="Note Content..."
          cols="2"
          rows="2"
        ></b-form-textarea>
      </div>
      <div>
        <b-form-textarea
          id="textarea-state"
          v-model="category"
          placeholder="Note Content..."
          cols="2"
          rows="2"
        ></b-form-textarea>
      </div>
      <div>
        <b-button type="submit">Add Note</b-button>
      </div>
    </b-form>
    <!-- <div><Kokg /></div> -->
    <div class="py-5">
      <form >
        <input v-model="prizeAmount" placeholder="donate" type="text" />
        <b-button @click.prevent="onSubmi">Add</b-button>
      </form>
    </div>
  </div>

</template>

<script>
import { mapGetters } from "vuex";
import axios from "axios";
// import Kokg from "./totalUserToSite.vue";

export default {
  name: "kolo",
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance"]),
    ...mapGetters("accounts", ["activeAccount", "activeBalance"]),
  },
  data() {
    return {
      langT: "",
      langF: "",
      category: "",
      linkT: "",
      prizeAmount:'',
    contractName: "SmartLearn",
    method : "decreaseCount"
    };
  },
  // components: {
  //   Kokg,
  // },
  props: { g: Number },
  methods: {
    onSubmi() {
      this.drizzleInstance.contracts['SmartLearn'].methods['donate'].cacheSend({
        from: this.activeAccount,
        value: this.drizzleInstance.web3.utils.toWei(this.prizeAmount, "ether"),
      });
    },
    orderCourse() {
      const article = {
        languageFrom: this.langF,
        languageTo: this.langT,
        category: this.category,
        link: this.linkT,
      };
      axios
        .post("http://127.0.0.1:8000/api/v1/fcourses/", article)
        .then((response) => (this.articleId = response.data.id));
      // let i =this.g--;
      this.drizzleInstance.contracts[this.contractName].methods[
          this.method
        ].cacheSend(this.g)
      
    },

  },
};
</script>
