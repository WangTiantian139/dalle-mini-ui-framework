import { createApp } from "vue";

import ElementPlus from "element-plus";
import "element-plus/dist/index.css";
import App from "./App.vue";

const app = createApp(App);

declare const serverUrl: string;
app.provide("serverUrl", serverUrl)

app.use(ElementPlus);
const vm = app.mount("#app");
