<template>
  <div>
    <el-container>
      <!-- <el-header> Header -->
      <!-- </el-header> -->
      <el-main>
        <el-row class="main-content-row" align="middle" justify="center">
          <el-card class="box-card">
            <template #header>
              <div class="card-header">
                <el-row justify="center">DELL-E mini</el-row>
              </div>
            </template>
            <image-form></image-form>
          </el-card>
        </el-row>
      </el-main>
      <el-footer>
        <el-row justify="center">
          DALL-E mini: an AI model that can generate images from any prompt
        </el-row>
      </el-footer>
    </el-container>
  </div>
</template>

<script setup lang="ts">
// import { ref, computed } from "vue";
import ImageForm from "./components/ImageForm.vue"
</script>

<style>
.main-content-row {
  height: 100%;
}
.el-main {
  height: 95vh;
  padding-bottom: 0px;
  padding-top: 0px;
}
.el-footer {
  height: 3vh;
  font-size: var(--el-font-size-extra-small);
}
.box-card {
  padding: 20px;
  min-width: 300px;
}
.card-header {
  font-size: var(--el-font-size-large);
}
</style>
