Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA532C873A
	for <lists+linux-audit@lfdr.de>; Mon, 30 Nov 2020 15:57:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-4AdGL_YmO5mV6OoTFNKysw-1; Mon, 30 Nov 2020 09:57:12 -0500
X-MC-Unique: 4AdGL_YmO5mV6OoTFNKysw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE78618C8C01;
	Mon, 30 Nov 2020 14:57:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B7B05D6A8;
	Mon, 30 Nov 2020 14:57:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66FF74BB40;
	Mon, 30 Nov 2020 14:57:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUEq4Z5019071 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 09:52:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 91EF61111A58; Mon, 30 Nov 2020 14:52:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DC551111A52
	for <linux-audit@redhat.com>; Mon, 30 Nov 2020 14:51:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3524858296
	for <linux-audit@redhat.com>; Mon, 30 Nov 2020 14:51:59 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org
	[80.241.56.161]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-114-SRO18H_VPKuGNqoRAw-FHg-1; Mon, 30 Nov 2020 09:51:56 -0500
X-MC-Unique: SRO18H_VPKuGNqoRAw-FHg-1
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Cl7NQ1q2LzQlKq
	for <linux-audit@redhat.com>; Mon, 30 Nov 2020 15:46:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030)
	with ESMTP id H4QEfHpHvHlZ for <linux-audit@redhat.com>;
	Mon, 30 Nov 2020 15:46:43 +0100 (CET)
Date: Mon, 30 Nov 2020 15:46:43 +0100 (CET)
From: foo@mailbox.org
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <561820673.189291.1606747603120@office.mailbox.org>
Subject: auditd for removable media/harddisks
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.31 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4FF49177D
X-Rspamd-UID: 061745
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4696164057214607741=="

--===============4696164057214607741==
Content-Type: multipart/alternative; 
	boundary="----=_Part_189290_509004365.1606747603118"

------=_Part_189290_509004365.1606747603118
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I want to track file writes on a removable harddisk:

$ mount
...
/dev/sda9 on /mnt/volatile_folder type ext4 (rw)
...
$ cat /etc/audit/audit.rules
...
-w /mnt/volatile_folder -p w -k folder
...

External processes regularly unmount, format and mount /dev/sda9. Currently unmounting the device stops the auditd volatile_folder watcher and I have to restart auditd. Is there a better way?

Thx + Best
Fir


------=_Part_189290_509004365.1606747603118
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div style="" class="default-style">
   <div class="default-style">
    Hi,
   </div>
   <div class="default-style">
    <br>
   </div>
   <div class="default-style">
    I want to track file writes on a removable harddisk:
   </div>
   <div class="default-style">
    <br>$ mount
    <br>...
    <br>/dev/sda9 on /mnt/volatile_folder type ext4 (rw)
    <br>...
   </div>
   <div class="default-style">
    $ cat /etc/audit/audit.rules
    <br>...
    <br>-w /mnt/volatile_folder -p w -k folder
    <br>...
   </div>
   <div class="default-style">
    <br>
   </div>
   <div class="default-style">
    External processes regularly unmount, format and mount /dev/sda9. Currently unmounting the device stops the auditd volatile_folder watcher and I have to restart auditd. Is there a better way?
   </div>
   <div class="default-style">
    <br>Thx + Best
    <br>
   </div>
   <div class="default-style">
    Fir
    <br>
   </div>
   <div class="default-style">
    <br>
   </div>
  </div>
 </body>
</html>
------=_Part_189290_509004365.1606747603118--

--===============4696164057214607741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4696164057214607741==--

