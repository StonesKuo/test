作者：蔡煥麟
日期：03/03/2000

Demo2 示範了一個簡單但實用的動態載入模組的範例，利用此範例所規範的架構可以
實際應用在更複雜的專案。以下是本範例所包含的 project 清單：

  BuildAll.bpg    - 包含所有專案的 project group。
  AppAddin.dpr    - 包含應用程式的共享變數或函式，以及動態載入 package 的
                    相關工具函式，這是一個 runtime only 的 package，作為應
                    用程式和其他動態載入模組之間溝通的管道，所以此模組必須
                    在應用程式及其他模組編譯之前先行編譯連結。
                    注意此模組的專案選項中把 Output 目錄設定為 Bin\ ，而把
                    DCP 目錄設定為 . ，也就是目前的目錄，因為應用程式及其
                    他模組都需要連結 AppAddin.dcp。
  PkgDemo.dpr     - 範例的主程式。注意在專案選項的 Package 頁夾中。Runtime
                    packages 要加入 AppAddin 才能順利編譯連結。
  Package1.dpk    - 動態載入的 package #1。由於此模組使用了 AppAddin 中所
                    提供的函式，所以在此 package 專案的 Requires 清單中必
                    須加入 AppAddin.dcp 才能順利編譯連結。
                    輸出的 Package1.bpl 存放在 Bin\ 目錄下。
  Package2.dpk    - 動態載入的 package #2。輸出的 Package1.bpl 存放在 Bin\
                    目錄下。
 
  以上各專案的 Output directory 都設定為 Bin\ 目錄，讓所有的 .EXE 及 .BPL 
  都輸出至 Bin\ 目錄下，而 DCP output directory 則設定為 . ，也就是專案所
  在的目錄，以方便各模組專案連結。如果不指定這兩種輸出路徑的話， Delphi 5
  的會將 .BPL 及 .DCP 輸出至 Delphi5\Projects\Bpl\ 目錄下，如此一來各個專
  案之間的模組可能會產生命名衝突甚至互相感擾的混亂情形。


修改說明:
修改者: deven tzu
日期：08/30/2001

要讓其他Package使用共用的TDataModule, 必需在project->Options->Packages->Build with runtime packages中
手動加入此TDataModule的Package Name, 並在Main Unit 中 uses 此 TDataModule unit, 並Create此TDataModule即可;
其他Package中的Units要使用此TDataModule和寫 "單獨執行檔" 方式一樣, 直接uese TDataModule unit就可以了, 
還有一點是Package的 Requires 中要加入此TDataModule package 的 .dcp (如範例程式的PkgDATA.dcp), 
如此可以和寫 "單獨執行檔" 一樣方便, 卻可以一樣享受Package的好處.