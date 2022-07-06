<template>
  <div class="container lesson-content">
    <div class="video-wrapper">
      <iframe
        class="video"
        width="640"
        height="360"
        allowfullscreen
        :src="`https://www.youtube.com/embed/${course.video}`"
      />
    </div>
    <b-col>
      {{ course.description }}
    </b-col>
    <b-button>button</b-button>
    <router-link :to="`/Add/${course._id}`"
      ><b-row>
        <b-button>add</b-button>
      </b-row></router-link
    >
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      courseId: this.$route.params.id,
      course: {},
    };
  },
  methods: {
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

<style>
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
}
</style>
