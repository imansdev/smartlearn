<template>
  <tr>
    <th style="color: #fcd200da" scope="row">{{ courseID }}</th>
    <td style="color: black">
      <strong>{{ course.description }}</strong>
    </td>
    <td style="color: black">
      <strong>{{ beautyDatetime(course.createdAt) }}</strong>
    </td>
    <td style="color: black">
      <strong>{{ beautyDatetime(course.deadline) }}</strong>
    </td>
    <td style="color: black">
      <strong>
        <div v-if="course.completed">
          <i class="fa-regular fa-square-check"></i> Completed At
          {{ timeSpent(course.finishedAt) }}
        </div>
        <div v-else-if="course.killed">
          <i class="fa-regular fa-rectangle-xmark"></i> Killed
        </div>
        <div v-else-if="course.deadline * 1000 < new Date().getTime()">
          <!-- {{ onKillSubmit() }} -->
          <!-- v-b-popover.hover.right="
            'When your deadline course expires your prize will be killed'
          " -->
          <b-button
          size="sm"
          variant="warning"
          @click.prevent="onKillSubmit"
          >&nbsp;&nbsp;&nbsp;Kill&nbsp;&nbsp;&nbsp;</b-button
        >
        </div>
        <div v-else>
          <b-button
            size="sm"
            variant="warning"
            @click.prevent="onCompleteSubmit"
          >
            Complete
          </b-button>
        </div>
      </strong>
    </td>
    <th style="color: black" scope="col">
      <strong>
        {{ prizeValueString(course.value) }}
      </strong>
    </th>
    <th style="color: black" scope="col">
      <strong><i class="fa-brands fa-ethereum"></i></strong>
    </th>
    <td style="color: black">
      <strong>
        <div v-if="course.punishMe">
          Active
        </div>
        <div v-else>Deactive</div>
      </strong>
    </td>
    <td style="color: black">
      <strong>
        <div v-if="course.toAnother">
          <b-button
            v-b-popover.hover.top="course.anotherWallet"
            :title="'To Address'"
            size="sm"
            variant="outline-dark"
            ><strong class="yesStyle">Yes</strong></b-button
          >
          <!-- <b-collapse id="collapse-1" class="mt-2">
            <p class="card-text">To Address</p>
            {{ course.anotherWallet }}
          </b-collapse> -->
        </div>

        <div v-else>No</div>
      </strong>
    </td>

    <td>
      <b-button
        v-if="course.killed || course.completed"
        size="sm"
        variant="danger"
        @click.prevent="onRemoveSubmit"
        ><i class="fa-regular fa-trash-can"></i
      ></b-button>
      <b-button
        v-else
        size="sm"
        variant="dark"
        @click.prevent="onRemoveSubmit"
        disabled
      >
        <i class="fa-regular fa-trash-can"></i>
      </b-button>
    </td>
  </tr>
</template>

<script>
import { mapGetters } from "vuex";
import moment from "moment";

export default {
  name: "CourseRow",
  props: {
    courseID: String,
    course: Object,
  },
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance"]),
  },
  methods: {
    doAction(_method) {
      this.drizzleInstance.contracts[this.contractName].methods[
        _method
      ].cacheSend(this.courseID);
    },
    onCompleteSubmit() {
      const method = "setComplete";

      this.doAction(method);
    },
    onKillSubmit() {
      const method = "kill";
      this.doAction(method);
      // return "please confirmed the transaction";
    },
    onRemoveSubmit() {
      const method = "remove";
      this.doAction(method);
    },
    showAnotherAddress() {},
    prizeValueString(_valueInWei) {
      const web3 = this.drizzleInstance.web3;
      const valueInWei = new web3.utils.BN(_valueInWei);
      if (valueInWei.toString() == "0") {
        return "-";
      }
      return web3.utils.fromWei(valueInWei);
    },
    beautyDatetime(timestamp) {
      if (timestamp == 0 || timestamp == "0") {
        return "-";
      }
      const m = moment(timestamp * 1000);
      const mAbsolute = m.format("YYYY/MM/DD HH:mm:ss");
      const mDiff = m.fromNow();
      return `${mAbsolute} (${mDiff})`;
    },
    timeSpent(finish) {
      const finishTime = moment(finish * 1000);

      const fDiff = finishTime.fromNow();
      return fDiff;
    },
  },
  data: () => ({
    contractName: "SmartLearn",
  }),
};
</script>
<style >
.yesStyle:hover{
  color: white;
}
.yesStyle{
  color: black;
}
</style>
