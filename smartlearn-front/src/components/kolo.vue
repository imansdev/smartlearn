<template>
  <div>
    <!-- <div>{{g}}</div> -->
    <b-form-group @submit.prevent="orderCourse">
      <div class="pt-2 pb-1"><i class="fa-solid fa-link"></i></div>
      <div class="pb-3 pt-1">
        <b-form-input
          v-model="linkT"
          placeholder="enter course link"
        ></b-form-input>
      </div>

      <div class="pt-2 pb-2"><i class="fa-solid fa-language"></i></div>
      <div class="pb-1">
        <b-form-input
          v-model="langF"
          placeholder="enter course language (From) "
        ></b-form-input>
      </div>
      <div class="pb-3 pt-1">
        <b-form-input
          v-model="langT"
          placeholder="enter course language (To)"
        ></b-form-input>
      </div>

      <div class="pt-2 pb-2"><i class="fa-solid fa-layer-group"></i></div>
      <div>
        <b-form-input
          v-model="category"
          placeholder="enter course category"
        ></b-form-input>
      </div>

      <div class="py-3">
        <b-button type="submit" variant="outline-dark">Offer course</b-button>
      </div>
    </b-form-group>
    <!-- <div><Kokg /></div> -->

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
  },
  data() {
    return {
      langT: "",
      langF: "",
      category: "",
      linkT: "",
      contractName: "SmartLearn",
      method: "decreaseCount",
    };
  },
  // components: {
  //   Kokg,
  // },
  props: { g: Number },
  methods: {
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
      ].cacheSend(this.g);
    },
  },
};
</script>
