������Ҫ��

* ����`AiDisk_a1`���`xray`�ļ��е�·����ͬĿ¼���൱�ڸ��Ƶ��ⴢ���豸�

* �޸�`xray/config.json`Ϊ��ͻ�����Ϣ��Ĭ��gfwlistģʽ������ڵ���⸺�أ�

* �������Ȩ�ޣ�ע��·������

  `chmod 775 -R /media/AiDisk_a1/xray/`

* ��������

  `sh /media/AiDisk_a1/xray/start.sh`

* ֹͣ����
  `sh /media/AiDisk_a1/xray/stop.sh`

* ��������
  ���Զ�������-�ű�-'�ڷ���ǽ����������ִ����'ճ��

  ```
  sleep 10
  sh /media/AiDisk_a1/xray/start.sh
  ```


ALL DONE!

ps:����config.json�ɲο�example-config�ļ��У�

ע�⣺�е�·�����ܲ���/media/AiDisk_a1/������/media/TFCARD_��������
�޸�start.sh��·����Ϊ���·����һ��������

���Ǳ��룩�������Ž��Զ���dnsmasq.conf����gfwlist��վ���ض�dns
conf-dir=/media/AiDisk_a1/v2ray/dnsmasq-gwlist/, *.hosts

