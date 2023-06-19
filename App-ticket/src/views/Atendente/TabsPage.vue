<template>
  <ion-page>
      <ion-header>
        <ion-toolbar>
            <img style="height: 59px; width: auto;" src="@/img/logodrc.png">
        </ion-toolbar>
      </ion-header>
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
          <ion-label>Cadastro aluno</ion-label>
        </ion-tab-button>
      </ion-tab-bar>
    </ion-tabs>
  </ion-page>
</template>

<script setup lang="ts">
import { IonTabBar, IonTabButton, IonTabs, IonLabel, IonIcon, IonPage, IonRouterOutlet, IonHeader, IonToolbar } from '@ionic/vue';
import { ellipse, square, triangle } from 'ionicons/icons';
</script>
