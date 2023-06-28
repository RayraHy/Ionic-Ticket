<template>
  <ion-page>
      <ion-header>
        <ion-toolbar>
            <img style="height: 59px; width: auto;" src="@/img/logodrc.png">
        </ion-toolbar>
      </ion-header>
      <ion-footer class="footer-toolbar">
        <!-- <ion-button class="sairbu" @click="Deslogar()">Sair da conta</ion-button> -->
      </ion-footer>
    <ion-tabs>
      <ion-router-outlet></ion-router-outlet>
      <ion-tab-bar slot="bottom">
        <ion-tab-button tab="tab1" href="/tabsT/tab1">
          <ion-icon aria-hidden="true" :icon="triangle" />
          <ion-label>Tickets</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="tab2" href="/tabsT/tab2">
          <ion-icon aria-hidden="true" :icon="ellipse" />
          <ion-label>Cadastro atendente</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="tab3" href="/tabsT/tab3">
          <ion-icon aria-hidden="true" :icon="square" />
          <ion-label>Cadastro integrante</ion-label>
        </ion-tab-button>
      </ion-tab-bar>
    </ion-tabs>
  </ion-page>
</template>

<script lang="ts">
import { IonTabBar, IonTabButton, IonTabs, IonLabel, IonIcon, IonPage, IonRouterOutlet, IonHeader, IonToolbar, IonFooter, IonButton } from '@ionic/vue';
import { ellipse, square, triangle } from 'ionicons/icons';

export default {
  components: {
    IonTabBar, IonTabButton, IonTabs, IonLabel, IonIcon, IonPage, IonRouterOutlet, IonHeader, IonToolbar, IonFooter, IonButton
  },
  methods: {
    Deslogar() {
      this.$router.push('/Login');
    },
}
}
</script>

<style scoped>
.sairbu {
  padding-bottom: 20px;
  margin-left: 50px;
}

.footer-toolbar {
  position: fixed;
  bottom: 40px;
  width: 100%;
  
}
</style>