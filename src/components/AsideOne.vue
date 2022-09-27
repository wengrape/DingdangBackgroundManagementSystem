<template>
  <div>
    <br />
    <h1 style="font-size: 26px; text-align: center">
      {{ isCollapse ? "后台" : "叮当网后台管理系统" }}
    </h1>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "AsideOne",
  data() {
    return {
      itemImage: require("../assets/dingdang.png"),
    };
  },
  computed: {
    ...mapState({ isCollapse: "collapse" }),
  },
};
</script>

<style>
</style>