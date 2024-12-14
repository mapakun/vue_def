<script setup>
import axios from "axios";

//.env 로 엑시오스 설정
const instance = axios.create({
  baseURL: process.env.VUE_APP_API_URL,
});

function test() {
  console.log("test");
}

const testApi = () => {
  console.log("api 호출");

  //.env 로 엑시오스 설정
  instance.post('/api/common/hello')
.then((res) => {
  console.log("잘왔음"+res);
})
.catch((err) => {
  console.log(err)
})

}

</script>



<template>
  <h1>Main Page</h1>
  <div @click="test">
    테스트 콘솔 호출
  </div>
  <div @click="testApi">
    테스트 API 호출
  </div>
</template>