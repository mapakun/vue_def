import { createWebHistory, createRouter } from "vue-router";
import Main from "@/views/MainView.vue";
import Login from "@/views/LoginView.vue";

const routes = [
  {
    path: "/",
    name: "Main",
    component: Main,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;