# Template Zabbix – D-Link DGS-1510 (SNMP v2c)

## 📌 Description

Ce template Zabbix permet le monitoring des switches **D-Link DGS-1510**
(testé sur **DGS-1510-52XMP – Build 1.81.004**) via **SNMP v2c**.

Il est volontairement **simple, stable et orienté production** :
- pas de CPU / RAM (non exposés de manière fiable sur ce modèle)
- uniquement des métriques réellement exploitables

---

## ✅ Fonctionnalités couvertes

### Supervision générale
- Uptime du switch (sysUpTime)
- Nom du switch (sysName)
- Description système (sysDescr)

### Interfaces réseau (LLD)
Découverte automatique des interfaces via IF-MIB / IFX-MIB :
- État opérationnel des ports
- Trafic entrant / sortant (bps)
- Filtrage des interfaces internes (CPU, VLAN, rif)

> ⚠️ Aucun nouvel hôte n’est créé :  
> la découverte ajoute uniquement des **items sur le switch existant**.

---

## 🔧 Prérequis

- Zabbix **6.4 ou supérieur**
- SNMP **v2c activé** sur le switch
- Communauté SNMP configurée (ex. `public`)
- Le switch doit être joignable depuis :
  - le serveur Zabbix **ou**
  - le proxy Zabbix assigné à l’hôte

---

## 📥 Import du template

1. Zabbix → **Collecte de données → Modèles → Importer**
2. Sélectionner le fichier :
