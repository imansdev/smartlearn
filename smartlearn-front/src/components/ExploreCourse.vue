<template>
  <div>
    <b-card
      no-body
      class="overflow-hidden shadowBoxStyle "
      style="max-width: 100%; max-height: 230px;"
    >
      <b-row no-gutters>
        <b-col md="3" class="aroundcolor">
          <b-card-img
            style="width: 266px; height: 230px;"
            :src="course.image"
            :alt="`${course.name} image`"
            class=" imgaround "
          ></b-card-img>
        </b-col>
        <b-col md="9" class="bgcourse">
          <b-card-body style="color:#fcd200da">
            <b-row
              ><span
                ><i class="fa-solid fa-certificate fa-lg fa-spin"></i
                ><span style="margin-left:10px;font-size:22px;">{{
                  course.name
                }}</span></span
              ></b-row
            >

            <b-row class="preambleS">
              <b-card-text>
                {{ course.description }}
              </b-card-text>
            </b-row>
            <b-row class="py-3">
              <b-col md="3"></b-col>
              <b-col md="6">
                <b-row>
                  <b-button
                    tag="router-link"
                    :to="`/courses/${course._id}`"
                    variant="outline-warning"
                    >GO</b-button
                  >
                </b-row>
              </b-col>
              <b-col md="3"></b-col>
            </b-row>
            <b-row>
              <b-card-sub-title id="Cinformations" class="py-3 text-center">
                <div>
                  Estimated Time {{ course.deadline }} Weeks
                  &nbsp;&nbsp;&nbsp;
                </div>
                <div>
                  Language From
                  {{ course.languageFrom }} &nbsp;&nbsp;&nbsp;
                </div>
                <div>
                  Language TO
                  {{ course.languageTo }} &nbsp;&nbsp;&nbsp;
                </div>
                <div>Created At {{ createdAt() }}</div>
                <!-- {{ course.deadline }} weeks | {{ course.languageTo }} -->
              </b-card-sub-title>
            </b-row>
          </b-card-body>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
import moment from "moment";

export default {
  props: { course: Object },
  methods: {
    createdAt() {
      const at = moment(this.course.createdAt);
      return at.fromNow();
    },
  },
};
</script>

<style>
#Cinformations {
  display: flex;
  text-align: center;
}
#Cinformations div {
  text-align: center;
  margin-right: 5px;
  margin-left: 5px;
}
.shadowBoxStyle {
  box-shadow: -15px 15px 10px #0c0c0b;
}
.righ {
  text-align: right;
}

.preambleS {
  /* white-space: normal; */
  /* white-space: nowrap; */
  /* display: block;  */
  /* direction: rlt ; */
  overflow: scroll;
  text-overflow: ellipsis;
  -o-text-overflow: ellipsis;

  width: 100%;
  /* position: fixed; */
  height: 60px;
  /* border: 5px solid black; */
  border-spacing: 0;
  font-family: "Segoe UI", sans-serif, "Helvetica Neue";
  font-size: 19px;
  /* padding-bottom: 100px; */
  padding-left: 100px;
  /* border: 1px solid #ccc; */
}
.dividercolor {
  color: black;
}
.bgcourse {
  background-color: black;
}
.aroundcolor {
  background-color: #fcd200da;
}
.imgaround {
  padding: 15px;
}
</style>
