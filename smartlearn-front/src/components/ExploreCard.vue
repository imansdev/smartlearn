<template>
  <div>
    <b-card
      no-body
      class="overflow-hidden imanlgk"
      style="max-width: 100%; max-height: 230px;"
    >
      <b-row no-gutters>
        <b-col md="4">
          <b-card-img
            style="width: 269px; height: 230px;"
            :src="course.image"
            :alt="`${course.name} image`"
            class="rounded-0 imgjj"
          ></b-card-img>
        </b-col>
        <b-col md="8" class="kk">
          <b-card-body :title="course.name">
            <b-row class="preambleS">
              <b-card-text>
                {{ course.description }}
              </b-card-text>
            </b-row>
            <b-row>
              <span>
              <b-col class="pt-1" md="7"> 
                <router-link :to="`/courses/${course._id}`"
                  ><b-row>
                    <b-button>go</b-button>
                  </b-row></router-link
                >
              </b-col>
              </span>
            </b-row>
            <b-row>
              <b-card-sub-title class="py-3 text-center">
                {{ course.deadline }} weeks | {{ course.languageTo }}
              </b-card-sub-title>
            </b-row>
          </b-card-body>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
export default {
  props: { course: Object },
};
</script>

<style>
.imanlgk {
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
  -o-text-overflow:ellipsis ;

  width: 500px;
  /* position: fixed; */
  height: 93px;
  /* border: 5px solid black; */
  border-spacing: 0;
  font-family: "Segoe UI", sans-serif, "Helvetica Neue";
  font-size: 16px;
  padding: 1em;
  /* border: 1px solid #ccc; */
}
.kk {
  background-color: #f5aa45;
}
.ll {
  background-color: #45b7f5;
}
.imgjj {
  max-width: auto;
  height: auto;
}
</style>
