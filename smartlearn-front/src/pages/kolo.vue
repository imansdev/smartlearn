<template>
  <div>
    <b-form @submit.prevent="addNote">
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
    <div><Kokg/></div>
  </div>
</template>

<script>
import axios from "axios";
import Kokg from '../components/Kokg.vue'
export default {
  data() {
    return {
      langT: "",
      langF: "",
      category: "",
      linkT: "",
    };
  },
  components:{
    Kokg,
  },
  methods: {
    addNote: function() {
      const article = {
        languageFrom: this.langF,
        languageTo: this.langT,
        category: this.category,
        link: this.linkT,
      };
      axios
        .post("http://127.0.0.1:8000/api/v1/fcourses/", article)
        .then((response) => (this.articleId = response.data.id));
    },
  },
};
</script>
