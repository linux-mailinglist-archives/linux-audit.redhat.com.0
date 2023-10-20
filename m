Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682E7D17A9
	for <lists+linux-audit@lfdr.de>; Fri, 20 Oct 2023 23:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697835796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fqe9mzTGwbKcEO0U/sFOmD3dCOJuxFZvVRZ0dsM3F3M=;
	b=E4iJziZSNHVAtHh431YKySW/PhVM3A1q+xdolG3nstl+0ZsiJOKpulfClZHdXDjxW7QX0/
	SiA2LIw24xfhjidhz7ReeiNp1EF34pmudBb1VWnIfsnGFQidHOu66EaK83EG+BIPPG97G0
	2QeZH18H2YSDKuzX9ilw647Dr6rEFqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-9VbuT_JMO16laDLy7yJArQ-1; Fri, 20 Oct 2023 17:03:13 -0400
X-MC-Unique: 9VbuT_JMO16laDLy7yJArQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEEB38C7ED9;
	Fri, 20 Oct 2023 21:03:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94722492BE0;
	Fri, 20 Oct 2023 21:03:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3CBA319452E1;
	Fri, 20 Oct 2023 21:03:00 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 364191946A75 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Oct 2023 19:23:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5031492BE0; Fri, 20 Oct 2023 19:23:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC1AF492BD9
 for <linux-audit@redhat.com>; Fri, 20 Oct 2023 19:23:48 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B884988904E
 for <linux-audit@redhat.com>; Fri, 20 Oct 2023 19:23:48 +0000 (UTC)
Received: from mailhub1-fb.kaspersky-labs.com
 (mailhub1-fb.kaspersky-labs.com [4.31.156.216]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-PxrWq3T8NV6cRxPW6VSb_g-1; Fri, 20 Oct 2023 15:23:46 -0400
X-MC-Unique: PxrWq3T8NV6cRxPW6VSb_g-1
Received: from mailhub1-fb.kaspersky-labs.com (unknown [127.0.0.11])
 by mailhub1-fb.kaspersky-labs.com (Postfix) with ESMTP id 31C73188426
 for <linux-audit@redhat.com>; Fri, 20 Oct 2023 22:14:23 +0300 (MSK)
Received: from mx12.kaspersky-labs.com (mx12.kaspersky-labs.com
 [91.103.66.155])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx12.kaspersky-labs.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub1-fb.kaspersky-labs.com (Postfix) with ESMTPS id C15EE18817D
 for <linux-audit@redhat.com>; Fri, 20 Oct 2023 22:14:22 +0300 (MSK)
Received: from relay12.kaspersky-labs.com (unknown [127.0.0.10])
 by relay12.kaspersky-labs.com (Postfix) with ESMTP id 939B97B296
 for <linux-audit@redhat.com>; Fri, 20 Oct 2023 22:14:18 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail-hq2.kaspersky.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id 5A1227B28B
 for <linux-audit@redhat.com>; Fri, 20 Oct 2023 22:14:18 +0300 (MSK)
Received: from [10.32.51.9] (10.64.68.128) by HQMAILSRV3.avp.ru (10.64.57.53)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.27; Fri, 20 Oct
 2023 22:14:17 +0300
Message-ID: <0c22c924-2c1d-4a4f-a4f2-ea477999c8a4@kaspersky.com>
Date: Fri, 20 Oct 2023 22:14:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <linux-audit@redhat.com>
From: Rinat Gadelshin <rinat.gadelshin@kaspersky.com>
Subject: Couldn't get audit messages for 'listen' on kernel 4.19.0-6-686-pae
X-Originating-IP: [10.64.68.128]
X-ClientProxiedBy: hqmailmbx2.avp.ru (10.64.67.242) To HQMAILSRV3.avp.ru
 (10.64.57.53)
X-KSE-ServerInfo: HQMAILSRV3.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 10/20/2023 18:57:21
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 180778 [Oct 20 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: rinat.gadelshin@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 542 542 3d23828e213bab96daa5e52f9cef518f74e40214
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions, from_kas}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 kaspersky.com:5.0.1,7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/20/2023 19:02:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/20/2023 6:25:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KLMS-Rule-ID: 52
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Status: not scanned, disabled by settings
X-KLMS-AntiSpam-Interceptor-Info: not scanned
X-KLMS-AntiPhishing: Clean, bases: 2023/10/20 17:20:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 bases: 2023/10/20 18:25:00 #22243472
X-KLMS-AntiVirus-Status: Clean, skipped
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mailman-Approved-At: Fri, 20 Oct 2023 21:02:59 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaspersky.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGVsbG8gdGhlcmUhCgpJJ20gZmFjaW5nIGEgc3RyYW5nZSBwcm9ibGVtLgpJIGhhdmUgbm90IGJl
ZW4gYWJsZSB0byBnZXQgYXVkaXQgcmVwb3J0cyBmb3IgYW55ICJuZXR3b3JrIiBzeXNjYWxsCm9u
IG9uZSBvZiB0aGUgY29tcHV0ZXJzIGZyb20gbXkgdGVzdCBiZW5jaC4KSSBtZWFuICdjb25uZWN0
JywgJ2FjY2VwdDQnLCAnbGlzdGVuJywgJ2JpbmQnLCAnc29ja2V0Jy4KVGhlIGZvbGxvd2luZyBl
eGFtcGxlIHNob3dzIHRoYXQgYXVkaXRkIGNvdWxkbid0IGdldCB0aGVtIHRvbyAoJ2xpc3Rlbicg
CmF0IGxlYXN0KS4KQnV0IEkndmUgcmVjZWl2ZWQgYSByZXBvcnQgYWJvdXQgJ2V4ZWN2ZScgY2Fs
bGVkIGJ5IHRoZSBzYW1lIHByb2Nlc3MuCgpDb3VsZCB5b3UgdGVsbCBtZSB3aGF0IGNhbiBJIGRv
IGluIG9yZGVyIHRvIHJlY2VpdmUgYXVkaXQgbWVzc2FnZXMgZm9yIAp0aGUgc3lzY2FsbHMuCmZy
b20gdGhpcyB2ZXJzaW9uIG9mIHRoZSBrZXJuZWw/CgpBbnkgaGVscCB3aWxsIGJlIHdpbGwgYmUg
YXBwcmVjaWF0ZWQuCgoKcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgbmV0Y2F0IC12IC1sIC1wIDQy
NDIgJgpbMl0gMTM0ODEKcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgbGlzdGVuaW5nIG9uIFthbnld
IDQyNDIgLi4uCnJvb3RAZGViMTAxLXg4Ni0wMDA5On4jIGVjaG8gIlRlc3QiIHwgbmMgLXEgMCAx
MjcuMC4wLjEgNDI0Mgpjb25uZWN0IHRvIFsxMjcuMC4wLjFdIGZyb20gbG9jYWxob3N0IFsxMjcu
MC4wLjFdIDM2NjUwClRlc3QKcm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgc2tpbGwgLXAgMTM0ODEK
WzJdK8KgIERvbmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXRjYXQg
LXYgLWwgLXAgNDI0Mgpyb290QGRlYjEwMS14ODYtMDAwOTp+IyBhdXNlYXJjaCAtcCAxMzQ4MQot
LS0tCnRpbWUtPkZyaSBPY3QgMjAgMjI6MDA6NDIgMjAyMwp0eXBlPVBST0NUSVRMRSBtc2c9YXVk
aXQoMTY5NzgyODQ0Mi42MDM6MjY5Nyk6IApwcm9jdGl0bGU9NkU2NTc0NjM2MTc0MDAyRDc2MDAy
RDZDMDAyRDcwMDAzNDMyMzQzMgp0eXBlPVBBVEggbXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2
OTcpOiBpdGVtPTEgCm5hbWU9Ii9saWIvbGQtbGludXguc28uMiIgaW5vZGU9NjU1MzgyIGRldj1m
ZTowMCBtb2RlPTAxMDA3NTUgb3VpZD0wIApvZ2lkPTAgcmRldj0wMDowMCBuYW1ldHlwZT1OT1JN
QUwgY2FwX2ZwPTAwMDAwMDAwMDAwMDAwMDAgCmNhcF9maT0wMDAwMDAwMDAwMDAwMDAwIGNhcF9m
ZT0wIGNhcF9mdmVyPTAKdHlwZT1QQVRIIG1zZz1hdWRpdCgxNjk3ODI4NDQyLjYwMzoyNjk3KTog
aXRlbT0wIG5hbWU9Ii91c3IvYmluL25ldGNhdCIgCmlub2RlPTY2NDg4NyBkZXY9ZmU6MDAgbW9k
ZT0wMTAwNzU1IG91aWQ9MCBvZ2lkPTAgcmRldj0wMDowMCAKbmFtZXR5cGU9Tk9STUFMIGNhcF9m
cD0wMDAwMDAwMDAwMDAwMDAwIGNhcF9maT0wMDAwMDAwMDAwMDAwMDAwIGNhcF9mZT0wIApjYXBf
ZnZlcj0wCnR5cGU9Q1dEIG1zZz1hdWRpdCgxNjk3ODI4NDQyLjYwMzoyNjk3KTogY3dkPSIvcm9v
dCIKdHlwZT1FWEVDVkUgbXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2OTcpOiBhcmdjPTUgYTA9
Im5ldGNhdCIgYTE9Ii12IiAKYTI9Ii1sIiBhMz0iLXAiIGE0PSI0MjQyIgp0eXBlPVNZU0NBTEwg
bXNnPWF1ZGl0KDE2OTc4Mjg0NDIuNjAzOjI2OTcpOiBhcmNoPTQwMDAwMDAzIHN5c2NhbGw9MTEg
CnN1Y2Nlc3M9eWVzIGV4aXQ9MCBhMD1lMzY0MDAgYTE9ZDlkOWUwIGEyPWUzYTMxMCBhMz01ODQ5
ODggaXRlbXM9MiAKcHBpZD0xMjk2OCBwaWQ9MTM0ODEgYXVpZD0wIHVpZD0wIGdpZD0wIGV1aWQ9
MCBzdWlkPTAgZnN1aWQ9MCBlZ2lkPTAgCnNnaWQ9MCBmc2dpZD0wIHR0eT1wdHMxIHNlcz00IGNv
bW09Im5ldGNhdCIgCmV4ZT0iL3Vzci9iaW4vbmMudHJhZGl0aW9uYWwiIHN1Ymo9PXVuY29uZmlu
ZWQga2V5PShudWxsKQpyb290QGRlYjEwMS14ODYtMDAwOTp+IyBhdWRpdGN0bCAtbAotYSBhbHdh
eXMsZXhpdCAtRiBhcmNoPWIzMiAtUyBmb3JrLGV4ZWN2ZSxjbG9uZSx2Zm9yayxleGVjdmVhdAot
YSBhbHdheXMsZXhpdCAtRiBhcmNoPWIzMiAtUyBiaW5kLGNvbm5lY3QsbGlzdGVuLGFjY2VwdDQK
cm9vdEBkZWIxMDEteDg2LTAwMDk6fiMgYXVkaXRjdGwgLXMKZW5hYmxlZCAxCmZhaWx1cmUgMQpw
aWQgMTMzOTMKcmF0ZV9saW1pdCAwCmJhY2tsb2dfbGltaXQgODE5Mgpsb3N0IDAKYmFja2xvZyAw
CmJhY2tsb2dfd2FpdF90aW1lIDAKbG9naW51aWRfaW1tdXRhYmxlIDAgdW5sb2NrZWQKcm9vdEBk
ZWIxMDEteDg2LTAwMDk6fiMgdW5hbWUgLWEKTGludXggZGViMTAxLXg4Ni0wMDA5LmF2cC5ydS5s
b2NhbCA0LjE5LjAtNi02ODYtcGFlICMxIFNNUCBEZWJpYW4gCjQuMTkuNjctMitkZWIxMHUyICgy
MDE5LTExLTExKSBpNjg2IEdOVS9MaW51eApyb290QGRlYjEwMS14ODYtMDAwOTp+IyBjYXQgL2V0
Yy9kZWJpYW5fdmVyc2lvbgoxMC4xCnJvb3RAZGViMTAxLXg4Ni0wMDA5On4jCgoKUmVnYXJkcwpS
aW5hdAoKLS0KTGludXgtYXVkaXQgbWFpbGluZyBsaXN0CkxpbnV4LWF1ZGl0QHJlZGhhdC5jb20K
aHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1hdWRpdAo=

