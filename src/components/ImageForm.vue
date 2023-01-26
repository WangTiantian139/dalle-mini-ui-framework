<template>
  <el-input
    v-model="promptText"
    size="large"
    placeholder="Enter your prompt..."
  />
  <el-row v-if="showAlert" class="alert-row">
    <span>* Please enter some prompts before you generate an image.</span>
  </el-row>
  <el-row justify="center" class="inline-row">
    <el-button
      type="primary"
      @click="generateImage"
      size="large"
      style="width: 100%"
      >Generate Image!</el-button
    >
  </el-row>
  <el-row class="inline-row">
    <single-image :image-url="imageUrl" :loading-status="loadingStatus" />
  </el-row>
  <el-row justify="end" class="inline-row">
    <el-link :underline="false" type="info">
      View more<el-icon class="el-icon--right"><arrow-right /></el-icon>
    </el-link>
  </el-row>
</template>

<script setup lang="ts">
import { ref, reactive, computed, inject } from "vue";
import SingleImage from "./SingleImage.vue";
import { ArrowRight } from "@element-plus/icons-vue";
import LoadingStatus from "./LoadingStatus";

const promptText = ref("");
const haveNotGenerated = ref(true);
const showAlert = computed(() => {
  // promptText===""  haveNotGenerated    showAlert
  // true             false               true
  // true             true                false
  // false            false               false
  // false            true                false
  return promptText.value === "" && !haveNotGenerated.value;
});
const curImageIndex = ref(-1);
const imageCount = ref(0);
const serverUrl = inject<string>("serverUrl", "127.0.0.1");
// const imageUrl = computed(() => serverUrl + "/view-image/" + curImageIndex.value);
const imageUrl = ref("");
const loadingStatus = ref(LoadingStatus.idle);

function generateImage(): void {
  haveNotGenerated.value = false;
  if (!showAlert.value) {
    // do something
    loadingStatus.value = LoadingStatus.loading;
    const url = serverUrl + "/generate-image/" + promptText.value;
    const httpRequest = new XMLHttpRequest();
    httpRequest.open("POST", url, true);
    httpRequest.send();
    httpRequest.onreadystatechange = function () {
      if (httpRequest.readyState === XMLHttpRequest.DONE) {
        if (httpRequest.status === 200) {
          // console.log("DONE! -> ", httpRequest.responseText);
          imageUrl.value = httpRequest.responseText;
          loadingStatus.value = LoadingStatus.done;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
    };
  }
}
</script>

<style>
.inline-row {
  padding-top: 20px;
}
.alert-row {
  padding-top: 5px;
  padding-left: 5px;
  font-size: var(--el-font-size-extra-small);
  color: var(--el-color-error);
  width: 250px;
}
</style>
