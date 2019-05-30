Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C42FB7E
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 14:21:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0DBA30A56A6;
	Thu, 30 May 2019 12:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17A627DF58;
	Thu, 30 May 2019 12:20:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A6681806B0F;
	Thu, 30 May 2019 12:20:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4U7bYbs005984 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 03:37:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7CFC05B0AC; Thu, 30 May 2019 07:37:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76553600C4
	for <linux-audit@redhat.com>; Thu, 30 May 2019 07:37:32 +0000 (UTC)
Received: from web-out.onbox.hu (fmfe37.onbox.hu [46.107.16.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3B284DB10
	for <linux-audit@redhat.com>; Thu, 30 May 2019 07:37:27 +0000 (UTC)
X-fm-smtp-source: yes
Received: from localhost (localhost [92.249.148.46])
	by web-out.onbox.hu (Postfix) with SMTP id 45Dztr0xbNz6k6;
	Thu, 30 May 2019 09:37:23 +0200 (CEST)
From: =?utf-8?Q?R=C3=B3bert_Nagy?= <robert.nagy1@freemail.hu>
Message-ID: <AxkNEg.6xBamOA67vUU.O6mFWVI0mE32fIXmL36@freemail.hu>
Subject: Missing login records - Audit functionality in different kernel
	versions
MIME-Version: 1.0
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
X-AccountId: 54268006
X-Originating-Ip: 92.249.148.46
Date: Thu, 30 May 2019 09:37:23 +0200 (CEST)
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddvkedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdcuhfftgffgofetkffnnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffkufggtgfvihffsegrtdersgdttdejnecuhfhrohhmpeftkpgsvghrthgppfgrghihuceorhhosggvrhhtrdhnrghghidusehfrhgvvghmrghilhdrhhhuqeenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppeelvddrvdegledrudegkedrgeeinecurfgrrhgrmhephhgvlhhopedpihhnvghtpeelvddrvdegledrudegkedrgeeipdhmrghilhhfrhhomheprhhosggvrhhtrdhnrghghidusehfrhgvvghmrghilhdrhhhupdhrtghpthhtoheplhhinhhugidqrghuughithesrhgvughhrghtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1559201844; 
	s=20181004; d=freemail.hu;
	h=From:Message-ID:Subject:MIME-Version:Content-Type:To:Date;
	l=3496; bh=5VsMoVt5WAD8xPGaUcCC0l16JESM196ycaJTEQNPvVw=;
	b=e9v+CoUR1EqFsnaPSZZgmNwfYAD7euwOfYb7c+4ISFNyoFq0HgPW2yu9lVUaZSZ/
	q3J9W25DOt5MfjFreH3yYSRJ5tpWBldMSPZ9uwoJewa3sdMLDRXfMwbPHe5zK0a71H6
	JUOUCZGzDERmLDjwtRqvS2jcbguGsftG+PU30jMlJ3zbamCSGig7d9DP2jWq9P82OvO
	Tq6m+UPWuXllEDeXUwCG9IzBgTOgJQOY2fI318EcpHQHwaKraK3ts3/oDMho0KAIaOb
	HDKF7BFCZS2qltuTBntL/i2voLBD5F+tLCvFMTTvLibbZGjUfpvrc2DO83kkmWLq07s
	LTYzu7aStg==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Thu, 30 May 2019 07:37:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 30 May 2019 07:37:30 +0000 (UTC) for IP:'46.107.16.242'
	DOMAIN:'fmfe37.onbox.hu' HELO:'web-out.onbox.hu'
	FROM:'robert.nagy1@freemail.hu' RCPT:''
X-RedHat-Spam-Score: 0.142  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 46.107.16.242 fmfe37.onbox.hu 46.107.16.242 fmfe37.onbox.hu
	<robert.nagy1@freemail.hu>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 30 May 2019 08:19:32 -0400
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
Content-Type: multipart/mixed; boundary="===============8684839510803541384=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 30 May 2019 12:21:16 +0000 (UTC)

--===============8684839510803541384==
Content-Type: multipart/alternative; 
	boundary="----=_Part_618_2137156019.1559201665866"

------=_Part_618_2137156019.1559201665866
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello all,

I tested Audit on a Debian 7 (kernel version 3.2.0-5-amd64), but in the audit.log I get no USER_AUTH, USER_ACCT, CRED_ACQ, USER_START and USER_LOGIN record types at all, Only USER_LOGIN types.

As I understand these records should be there without any rules set.
https://www.redhat.com/archives/linux-audit/2017-July/msg00046.html

On another server with kernel version 4.9 it works properly. Is there a possibility that this Audit functionality is not implemented in kernel version 3.2, or is this just a configuration issue on my side?

We have too many Debian 3.x production servers to consider kernel upgrade being an option.

If it's a kernel issue, could you please recommend any workaround? Currently I am thinking on parsing the auth.log

Many thanks,
Robert

auditd.conf:
log_file = /var/log/audit/audit.log
log_format = RAW
log_group = root
priority_boost = 4
flush = INCREMENTAL
freq = 20
num_logs = 4
disp_qos = lossy
dispatcher = /sbin/audispd
name_format = NONE
##name = mydomain
max_log_file = 5
max_log_file_action = ROTATE
space_left = 75
space_left_action = SYSLOG
action_mail_acct = root
admin_space_left = 50
admin_space_left_action = SUSPEND
disk_full_action = SUSPEND
disk_error_action = SUSPEND
##tcp_listen_port =
tcp_listen_queue = 5
tcp_max_per_addr = 1
##tcp_client_ports = 1024-65535
tcp_client_max_idle = 0
enable_krb5 = no
krb5_principal = auditd
##krb5_key_file = /etc/audit/audit.key
------=_Part_618_2137156019.1559201665866
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello all,<br />
<br />
I tested Audit on a Debian 7 (kernel version 3.2.0-5-amd64), but in the audit.log I get no USER_AUTH, USER_ACCT, CRED_ACQ, USER_START and USER_LOGIN record types at all, Only USER_LOGIN types.<br />
<br />
As I understand these records should be there without any rules set.<br />
https://www.redhat.com/archives/linux-audit/2017-July/msg00046.html<br />
<br />
On another server with kernel version 4.9 it works properly. Is there a possibility that this Audit functionality is not implemented in kernel version 3.2, or is this just a configuration issue on my side?<br />
<br />
We have too many Debian 3.x production servers to consider kernel upgrade being an option.<br />
<br />
If it&#39;s a kernel issue, could you please recommend any workaround? Currently I am thinking on parsing the auth.log<br />
<br />
Many thanks,<br />
Robert<br />
<br />
auditd.conf:<br />
log_file = /var/log/audit/audit.log<br />
log_format = RAW<br />
log_group = root<br />
priority_boost = 4<br />
flush = INCREMENTAL<br />
freq = 20<br />
num_logs = 4<br />
disp_qos = lossy<br />
dispatcher = /sbin/audispd<br />
name_format = NONE<br />
##name = mydomain<br />
max_log_file = 5<br />
max_log_file_action = ROTATE<br />
space_left = 75<br />
space_left_action = SYSLOG<br />
action_mail_acct = root<br />
admin_space_left = 50<br />
admin_space_left_action = SUSPEND<br />
disk_full_action = SUSPEND<br />
disk_error_action = SUSPEND<br />
##tcp_listen_port =<br />
tcp_listen_queue = 5<br />
tcp_max_per_addr = 1<br />
##tcp_client_ports = 1024-65535<br />
tcp_client_max_idle = 0<br />
enable_krb5 = no<br />
krb5_principal = auditd<br />
##krb5_key_file = /etc/audit/audit.key
------=_Part_618_2137156019.1559201665866--


--===============8684839510803541384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============8684839510803541384==--

