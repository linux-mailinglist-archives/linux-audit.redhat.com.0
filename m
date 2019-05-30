Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A132FF27
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 17:15:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACDCC3082E55;
	Thu, 30 May 2019 15:14:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BBDA7A514;
	Thu, 30 May 2019 15:14:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5FEB206D2;
	Thu, 30 May 2019 15:14:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4UFBuhH003582 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 11:11:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A07007C55C; Thu, 30 May 2019 15:11:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9852B7C55B
	for <linux-audit@redhat.com>; Thu, 30 May 2019 15:11:54 +0000 (UTC)
Received: from web-out.onbox.hu (fmfe37.onbox.hu [46.107.16.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E908E9FFFA
	for <linux-audit@redhat.com>; Thu, 30 May 2019 15:11:39 +0000 (UTC)
X-fm-smtp-source: yes
Received: from localhost (localhost [92.249.148.46])
	by web-out.onbox.hu (Postfix) with SMTP id 45F9yy0yYHz754;
	Thu, 30 May 2019 17:11:38 +0200 (CEST)
From: =?utf-8?Q?R=C3=B3bert_Nagy?= <robert.nagy1@freemail.hu>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <AxkQnw.DojO6sY8KOO.G6ELBQGJHRFdjRqyI7Mm@freemail.hu>
In-Reply-To: <9453511.RplY5aRnKT@x2>
References: <AxkNEg.6xBamOA67vUU.O6mFWVI0mE32fIXmL36@freemail.hu>
	<9453511.RplY5aRnKT@x2>
Subject: Re: Missing login records - Audit functionality in different kernel
	versions
MIME-Version: 1.0
X-AccountId: 54268006
X-Originating-Ip: 92.249.148.46
Date: Thu, 30 May 2019 17:11:38 +0200 (CEST)
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddvledgkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpucfhtffggffotefknfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffkjghfufggtghiffesrgdtregstddtjeenucfhrhhomheptfpksggvrhhtpgfprghghicuoehrohgsvghrthdrnhgrghihudesfhhrvggvmhgrihhlrdhhuheqnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkphepledvrddvgeelrddugeekrdegieenucfrrghrrghmpehhvghloheppdhinhgvthepledvrddvgeelrddugeekrdegiedpmhgrihhlfhhrohhmpehrohgsvghrthdrnhgrghihudesfhhrvggvmhgrihhlrdhhuhdprhgtphhtthhopehlihhnuhigqdgruhguihhtsehrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1559229098; 
	s=20181004; d=freemail.hu;
	h=From:To:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Date;
	l=5857; bh=zbZm3ZwKjLAPI4cqkPBDri2B3vlL2+gAD8nqQpwlsmo=;
	b=ERjAnrwIZyUlDM2lv7nz+3iOD7CGdja5jIkxqApYRU1cXJwRxh69JXVfSToK2UMq
	o5PvdTwwj5T0ZpIA+IE9JscWKvJzRQFi3xGITkRpbuRlxBnjw5WoCV9kxOxt0zu3+fe
	K9EqKffRqotaKYzi1Vtqxu2+s0a5ym9GfS+n+OlhCeuJ6XvlEO0P9oIRfV/SO7WVSqO
	qPqREoAQQyIvEzzKuTx49qX3tNFZhiTcpnpBey6FPHLu4cmUVswGFB7W2PxMTdZW4xx
	vGWR5CETb4sOmWu2fu4h7uVW1UeZnn47kc/1y17OY4TEYysAoZlsWPSqLsMa4/aT8bl
	hd/rAs4r0g==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Thu, 30 May 2019 15:11:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Thu, 30 May 2019 15:11:40 +0000 (UTC) for IP:'46.107.16.242'
	DOMAIN:'fmfe37.onbox.hu' HELO:'web-out.onbox.hu'
	FROM:'robert.nagy1@freemail.hu' RCPT:''
X-RedHat-Spam-Score: 0.144  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 46.107.16.242 fmfe37.onbox.hu 46.107.16.242 fmfe37.onbox.hu
	<robert.nagy1@freemail.hu>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Content-Type: multipart/mixed; boundary="===============4282336960403730414=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 30 May 2019 15:15:10 +0000 (UTC)

--===============4282336960403730414==
Content-Type: multipart/alternative; 
	boundary="----=_Part_2362_1736767868.1559228853194"

------=_Part_2362_1736767868.1559228853194
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Steve, thank you for your quick response!
Indeed, that's the problem. My copy of PAM is not compiled with audit suppo=
rt.
Many thanks, again,
Robert
=C2=A0

-------- Eredeti lev=C3=A9l --------

Felad=C3=B3: Steve Grubb <sgrubb@redhat.com>
D=C3=A1tum: 2019 m=C3=A1jus 30 14:31:19
T=C3=A1rgy: Re: Missing login records - Audit functionality in different ke=
rnel versions
C=C3=ADmzett: linux-audit@redhat.com

Hello,

On Thursday, May 30, 2019 3:37:23 AM EDT R=C3=B3bert Nagy wrote:
> I tested Audit on a Debian 7 (kernel version 3.2.0-5-amd64), but in the
> audit.log I get no USER_AUTH, USER_ACCT, CRED_ACQ, USER_START and
> USER_LOGIN record types at all, Only USER_LOGIN types.
>
> As I understand these records should be there without any rules set.
> https://www.redhat.com/archives/linux-audit/2017-July/msg00046.html

Yes. These are sent by pam. So, the question would be, is your copy of pam
compiled with audit support?

ldd /usr/lib64/libpam_misc.so | grep libaudit
libaudit.so.1 =3D> /lib64/libaudit.so.1 (0x00007f06c2c39000)


> On another server with kernel version 4.9 it works properly. Is there a
> possibility that this Audit functionality is not implemented in kernel
> version 3.2, or is this just a configuration issue on my side?

This should be pam.

-Steve

> We have too many Debian 3.x production servers to consider kernel upgrade
> being an option.
>
> If it's a kernel issue, could you please recommend any workaround?
> Currently I am thinking on parsing the auth.log
>
> Many thanks,
> Robert
>
> auditd.conf:
> log_file =3D /var/log/audit/audit.log
> log_format =3D RAW
> log_group =3D root
> priority_boost =3D 4
> flush =3D INCREMENTAL
> freq =3D 20
> num_logs =3D 4
> disp_qos =3D lossy
> dispatcher =3D /sbin/audispd
> name_format =3D NONE
> ##name =3D mydomain
> max_log_file =3D 5
> max_log_file_action =3D ROTATE
> space_left =3D 75
> space_left_action =3D SYSLOG
> action_mail_acct =3D root
> admin_space_left =3D 50
> admin_space_left_action =3D SUSPEND
> disk_full_action =3D SUSPEND
> disk_error_action =3D SUSPEND
> ##tcp_listen_port =3D
> tcp_listen_queue =3D 5
> tcp_max_per_addr =3D 1
> ##tcp_client_ports =3D 1024-65535
> tcp_client_max_idle =3D 0
> enable_krb5 =3D no
> krb5_principal =3D auditd
> ##krb5_key_file =3D /etc/audit/audit.key



=C2=A0

------=_Part_2362_1736767868.1559228853194
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

Steve, thank you for your quick response!<br />
Indeed, that&#39;s the problem. My copy of PAM is not compiled with audit support.<br />
Many thanks, again,<br />
Robert<br />
&#160;
<blockquote class="fm-read-more">
<div data-ng="originalcontent">-------- Eredeti lev&#233;l --------</div>
<br />
Felad&#243;: Steve Grubb &#60;<a href="mailto:sgrubb@redhat.com" rel="nofollow">sgrubb@redhat.com</a>&#62;<br />
D&#225;tum: 2019 m&#225;jus 30 14:31:19<br />
T&#225;rgy: Re: Missing login records - Audit functionality in different kernel versions<br />
C&#237;mzett: <a href="mailto:linux-audit@redhat.com" rel="nofollow">linux-audit@redhat.com</a><br />
<br />
Hello,<br />
<br />
On Thursday, May 30, 2019 3:37:23 AM EDT R&#243;bert Nagy wrote:<br />
&#62; I tested Audit on a Debian 7 (kernel version 3.2.0-5-amd64), but in the<br />
&#62; audit.log I get no USER_AUTH, USER_ACCT, CRED_ACQ, USER_START and<br />
&#62; USER_LOGIN record types at all, Only USER_LOGIN types.<br />
&#62;<br />
&#62; As I understand these records should be there without any rules set.<br />
&#62; https://www.redhat.com/archives/linux-audit/2017-July/msg00046.html<br />
<br />
Yes. These are sent by pam. So, the question would be, is your copy of pam<br />
compiled with audit support?<br />
<br />
ldd /usr/lib64/libpam_misc.so | grep libaudit<br />
libaudit.so.1 =&#62; /lib64/libaudit.so.1 (0x00007f06c2c39000)<br />
<br />
<br />
&#62; On another server with kernel version 4.9 it works properly. Is there a<br />
&#62; possibility that this Audit functionality is not implemented in kernel<br />
&#62; version 3.2, or is this just a configuration issue on my side?<br />
<br />
This should be pam.<br />
<br />
-Steve<br />
<br />
&#62; We have too many Debian 3.x production servers to consider kernel upgrade<br />
&#62; being an option.<br />
&#62;<br />
&#62; If it&#39;s a kernel issue, could you please recommend any workaround?<br />
&#62; Currently I am thinking on parsing the auth.log<br />
&#62;<br />
&#62; Many thanks,<br />
&#62; Robert<br />
&#62;<br />
&#62; auditd.conf:<br />
&#62; log_file = /var/log/audit/audit.log<br />
&#62; log_format = RAW<br />
&#62; log_group = root<br />
&#62; priority_boost = 4<br />
&#62; flush = INCREMENTAL<br />
&#62; freq = 20<br />
&#62; num_logs = 4<br />
&#62; disp_qos = lossy<br />
&#62; dispatcher = /sbin/audispd<br />
&#62; name_format = NONE<br />
&#62; ##name = mydomain<br />
&#62; max_log_file = 5<br />
&#62; max_log_file_action = ROTATE<br />
&#62; space_left = 75<br />
&#62; space_left_action = SYSLOG<br />
&#62; action_mail_acct = root<br />
&#62; admin_space_left = 50<br />
&#62; admin_space_left_action = SUSPEND<br />
&#62; disk_full_action = SUSPEND<br />
&#62; disk_error_action = SUSPEND<br />
&#62; ##tcp_listen_port =<br />
&#62; tcp_listen_queue = 5<br />
&#62; tcp_max_per_addr = 1<br />
&#62; ##tcp_client_ports = 1024-65535<br />
&#62; tcp_client_max_idle = 0<br />
&#62; enable_krb5 = no<br />
&#62; krb5_principal = auditd<br />
&#62; ##krb5_key_file = /etc/audit/audit.key<br />
<br />
<br />
<br />
&#160;</blockquote>

------=_Part_2362_1736767868.1559228853194--


--===============4282336960403730414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============4282336960403730414==--

