�@�̡G������
����G03/03/2000

Demo2 �ܽd�F�@��²�����Ϊ��ʺA���J�Ҳժ��d�ҡA�Q�Φ��d�ҩҳW�d���[�c�i�H
������Φb��������M�סC�H�U�O���d�ҩҥ]�t�� project �M��G

  BuildAll.bpg    - �]�t�Ҧ��M�ת� project group�C
  AppAddin.dpr    - �]�t���ε{�����@���ܼƩΨ禡�A�H�ΰʺA���J package ��
                    �����u��禡�A�o�O�@�� runtime only �� package�A�@����
                    �ε{���M��L�ʺA���J�Ҳդ������q���޹D�A�ҥH���Ҳե���
                    �b���ε{���Ψ�L�ҲսsĶ���e����sĶ�s���C
                    �`�N���Ҳժ��M�׿ﶵ���� Output �ؿ��]�w�� Bin\ �A�ӧ�
                    DCP �ؿ��]�w�� . �A�]�N�O�ثe���ؿ��A�]�����ε{���Ψ�
                    �L�Ҳճ��ݭn�s�� AppAddin.dcp�C
  PkgDemo.dpr     - �d�Ҫ��D�{���C�`�N�b�M�׿ﶵ�� Package �������CRuntime
                    packages �n�[�J AppAddin �~�බ�Q�sĶ�s���C
  Package1.dpk    - �ʺA���J�� package #1�C�ѩ󦹼ҲըϥΤF AppAddin ����
                    ���Ѫ��禡�A�ҥH�b�� package �M�ת� Requires �M�椤��
                    ���[�J AppAddin.dcp �~�බ�Q�sĶ�s���C
                    ��X�� Package1.bpl �s��b Bin\ �ؿ��U�C
  Package2.dpk    - �ʺA���J�� package #2�C��X�� Package1.bpl �s��b Bin\
                    �ؿ��U�C
 
  �H�W�U�M�ת� Output directory ���]�w�� Bin\ �ؿ��A���Ҧ��� .EXE �� .BPL 
  ����X�� Bin\ �ؿ��U�A�� DCP output directory �h�]�w�� . �A�]�N�O�M�ש�
  �b���ؿ��A�H��K�U�ҲձM�׳s���C�p�G�����w�o��ؿ�X���|���ܡA Delphi 5
  ���|�N .BPL �� .DCP ��X�� Delphi5\Projects\Bpl\ �ؿ��U�A�p���@�ӦU�ӱM
  �פ������Ҳեi��|���ͩR�W�Ĭ�Ʀܤ��۷P�Z���V�ñ��ΡC


�קﻡ��:
�ק��: deven tzu
����G08/30/2001

�n����LPackage�ϥΦ@�Ϊ�TDataModule, ���ݦbproject->Options->Packages->Build with runtime packages��
��ʥ[�J��TDataModule��Package Name, �æbMain Unit �� uses �� TDataModule unit, ��Create��TDataModule�Y�i;
��LPackage����Units�n�ϥΦ�TDataModule�M�g "��W������" �覡�@��, ����uese TDataModule unit�N�i�H�F, 
�٦��@�I�OPackage�� Requires ���n�[�J��TDataModule package �� .dcp (�p�d�ҵ{����PkgDATA.dcp), 
�p���i�H�M�g "��W������" �@�ˤ�K, �o�i�H�@�˨ɨ�Package���n�B.