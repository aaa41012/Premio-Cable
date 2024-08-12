<script setup lang="ts">
import mail from './../components/icons/mail.vue'
</script>
<template>
  <div class="contact">
    <section class="middle items-center">
      <div class="middle-img flex justify-center">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.332280335437!2d121.41359937609894!3d25.02279523874137!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a78942976879%3A0x615c6fe313fa66a6!2zMjQy5paw5YyX5biC5paw6I6K5Y2A5Lit5q2j6Lev5paw5pe65be3MzLomZ8!5e0!3m2!1szh-TW!2stw!4v1721619485580!5m2!1szh-TW!2stw"
          width="600"
          height="450"
          border="0"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </div>
      <div class="middle-text normal-text">
        <p class="font-bold mb-4 title">Company profile</p>
        <p class="mb-4">
          世鋒成立於1996年，致力於各式線材的加工及買賣，其中包括電話線、各式線組、排線、連接線、傳輸線、防水接頭線等等，所有的線材也都可以根據客戶規格訂製，來滿足設計條件及要求，並以合理的價格帶給客戶高品質及完善的服務，歡迎OEM/ODM案子，成為您最可靠的合作夥伴
        </p>
        <p>
          Premio Cable & Wire CO., LTD was founded in 1996. During this period, Premio Cable & Wire
          has been committed to processing and trading of various wires. Including telephone wires,
          various wire sets, flat cables, connecting wires, transmission wires, waterproof connector
          wires, etc. All wires can be customized according to customer specifications to meet
          design conditions and requirements. And provide customers with high quality and perfect
          services at reasonable prices. Also OEM/ODM cases are welcome and we will become your most
          reliable partner.
        </p>
      </div>
    </section>
    <section class="mobile">
      <div class="contact-text normal-text">
        <p class="font-bold mb-4 title">聯絡我們</p>
        <p>世鋒實業有限公司</p>
        <p>242新北市新莊區中正路新旺巷32號</p>
        <p>電話：(02)2902-0645,2908-7855</p>
        <p>傳真：(02)2903-8277</p>
        <p class="flex items-center">
          電子郵件: jamie@premiocable.com.tw<mail class="mail ml-2 black-fill" />
        </p>
        <p class="flex items-center">
          電子郵件: allen@premiocable.com.tw<mail class="mail ml-2 black-fill" />
        </p>
        <p>官方網站: http://www.premiocable.com.tw</p>
      </div>
    </section>
    <section class="mobile">
      <div class="contact-text normal-text">
        <p class="font-bold mb-4 title">Contact us</p>
        <p>Taiwan Office:</p>
        <p>
          No. 32, Hsin Wang Lane, Chung Cheng Rd., Hsin Wang Lane, Chung Cheng Rd., Taipei 242,
          Taiwan, R.O.C.
        </p>
        <p>Tel: (886-2) 2904-0722-3, 2902-0645</p>
        <p>Fax: (886-2) 2903-8277</p>
        <p class="flex items-center">
          e-mail: angela@premiocable.com.tw <mail class="mail ml-2 black-fill" />
        </p>
        <p class="flex items-center">
          e-mail: allen@premiocable.com.tw <mail class="mail ml-2 black-fill" />
        </p>
        <!-- <p class="flex items-center">
          johnson@premiocable.com.tw <mail class="mail ml-2 black-fill" />
        </p> -->
        <p>Official website: http://www.premiocable.com.tw</p>
      </div>
    </section>
  </div>
</template>

<style scoped lang="scss">
.middle {
  @include flex;
  @include justify-center;
  align-items: flex-start;
  padding: 3vw 4vw;
  .middle-img {
    width: 50%;
    @include flex;
    @include items-center;
  }
  .middle-text {
    width: 50%;
    line-height: 1.6rem;
  }
}
.mobile {
  display: none;
}
.contact-text {
  display: flex;
  width: 75%;
  margin: auto;
  flex-direction: column;
  padding-bottom: 4rem;
  line-height: 1.6rem;
}
iframe {
  margin-right: 1rem;
  border: 0 !important;
}
@media (max-width: 768px) {
  .middle {
    align-items: center;
    flex-direction: column;
    .middle-text,
    .middle-img {
      width: 80%;
      margin-bottom: 1rem;
    }
  }
  .mobile {
    display: flex;
  }
}
</style>
