Delphi Package 範例程式 for Delphi 5.
作者：蔡煥麟
=====================================
建立過程：

1. Open BuildAll.bpg
2. Build Project1.exe
3. Build AppAddin.bpl
4. Build DmodIntf.bpl
5. Build Dmodule2.bpl
6. Build Query2.bpl

其中 DmodIntf 是一個 Design-time and runtime package, 裡面包含一個基礎資料
模組類別 TBaseDataModule，該基礎類別中可以定義所有資料模組必須的通用方法。

Dmodule2 package 內含一個資料模組 TMyDataModule，是繼承自TBaseDataModule。
Query2 則是使用了 Dmodule2 package 的視覺化介面，請注意 Query2 對於類別
TMyDataModule 的了解很少，它只知道 TMyDataModule 一定具備了TBaseDataModule
所提供的方法，所以只呼叫這些已知道方法。透過 TBaseDataModule, 我們制定了一
個資料模組的通用介面，以降低視覺化介面與資料存取介面之間的藕合。
