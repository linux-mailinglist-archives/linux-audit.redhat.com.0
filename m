Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D16952F9
	for <lists+linux-audit@lfdr.de>; Mon, 13 Feb 2023 22:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676323509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2W+/NAK6/hWrtRNg8EBf2HP3LtteZnxPBqTeFkzMLfw=;
	b=MLibzWBmdPMkiCvI5tLtW58v12m9+5F69Eh5ydiIe+O+zIg6Q5MhFAgoSNIB7wS5NKcJiq
	wrJrwibBoVmzWeig7k65E+VgAk536L5kJth/X3h5/ss+nx71MKjmlNVT4sEQA1EbiigDQy
	gXgmZTWO3OydzAUhHs5I788B4f+hYaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-hLCW8_l1ObSUHyIIi0GWOg-1; Mon, 13 Feb 2023 16:25:08 -0500
X-MC-Unique: hLCW8_l1ObSUHyIIi0GWOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F2811802CEA;
	Mon, 13 Feb 2023 21:25:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 351942026D4B;
	Mon, 13 Feb 2023 21:24:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21CE919465A0;
	Mon, 13 Feb 2023 21:24:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C35551946586 for <linux-audit@listman.corp.redhat.com>;
 Mon, 13 Feb 2023 21:24:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A3C15400D927; Mon, 13 Feb 2023 21:24:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE7940C83B6
 for <linux-audit@redhat.com>; Mon, 13 Feb 2023 21:24:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 823F038149AB
 for <linux-audit@redhat.com>; Mon, 13 Feb 2023 21:24:16 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-4nSHdqV3OAyVrzfiCr3McQ-1; Mon, 13 Feb 2023 16:24:14 -0500
X-MC-Unique: 4nSHdqV3OAyVrzfiCr3McQ-1
Received: by mail-qt1-f179.google.com with SMTP id h24so15507320qtr.0
 for <linux-audit@redhat.com>; Mon, 13 Feb 2023 13:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RALgXOrpeDSzKk6lVjD2ejMlaIRvMQHAQRp15I2pk20=;
 b=hWEYkO9y/9yEVSbC6oaBg2CJ3pSmhJL5vu+t8v5Sfb/oV25QAYw5vPMbcdZrDqOjkG
 ZrpsWVO61nQ13QuQXeDbEYy6eZUEbvYqdasbdeyYPRuaTICj6TjnsQJc+RICfw5sCnzX
 VF+ZTj7bIjBhuLlatAf/XkhvF7MNygBXyYGmPXkP/3vi6ya2euRncP913jlXcQGdqJ0F
 tHqyqQa+tsUczB1K/A/REmessrwM7fuANxac0+F3J5ER2Z3ppGwLnHvp7+KYCCxIaGQH
 E7BSysidj81Z51QYL5QmmswH9KB1JnGccgIyCHu3T2FuSMZqc5BeY0b8wsm4dK8r9R59
 VkVw==
X-Gm-Message-State: AO0yUKWgm8BGK1swqHvGb/UYEZ0gZZ1nSFV6ktz9p4tyF+m2p50ct+Nu
 0cRHL3ACt7rer1eireKjMtx+WiKNf2TCcqVF6pnnEwqyAHaEdWYRCc0=
X-Google-Smtp-Source: AK7set/Hegf650twotla2QkziU3t/VAw7f7jyhiL/fGv5hPGJzLCF7ld2pVCIK77/BcsTiYOs5jeD+n9GuSsUPsv/rU=
X-Received: by 2002:a05:622a:1886:b0:3a9:8370:63d7 with SMTP id
 v6-20020a05622a188600b003a9837063d7mr4658876qtc.362.1676323453659; Mon, 13
 Feb 2023 13:24:13 -0800 (PST)
MIME-Version: 1.0
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Mon, 13 Feb 2023 15:24:02 -0600
Message-ID: <CAJcJf=TSvQxtFxNTkizfk_B1Y2WxE60Ct8HzHkt8RWhKMLnpUQ@mail.gmail.com>
Subject: Clarification Around File System Auditing
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Mon, 13 Feb 2023 21:24:56 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8374290242724846150=="

--===============8374290242724846150==
Content-Type: multipart/alternative; boundary="000000000000fbee2a05f49b77a4"

--000000000000fbee2a05f49b77a4
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,

I wanted some help in better understanding the workflow of file system
auditing(watch rules) vs Syscall Auditing(syscall rules). I know in general
file system auditing does not have the same performance impact as syscall
auditing, even though both make use of syscall exits for their evaluation.


From the manpage - "Unlike most syscall auditing rules, watches do not
impact performance based on the number of rules sent to the kernel."

From a previous thread, I found this excerpt regarding file watch rules vs
sycall rules -
"The reason it doesn't have performance impact like normal syscall rules is
because it gets moved to a list that is not evaluated every syscall. A
normal syscall rule will get evaluated for every syscall because it has to
see if the syscall number is of interest and then it checks the next rule."

Based on this I had a couple of questions:

For normal syscall rules, the evaluation happens as __audit_syscall_exit
<https://elixir.bootlin.com/linux/v6.1.10/C/ident/__audit_syscall_exit> calls
audit_filter_syscall
(https://elixir.bootlin.com/linux/v6.1.10/source/kernel/auditsc.c#L841)

Here, we check if the syscall is of interest or not in the audit_in_mask
<https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_in_mask> function.
Only if the syscall is of interest do we proceed with examining the task
and return on the first rule match.

1. What is the process or code path for watch rules? audit_filter_syscall
<https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_filter_syscall> is
called for watch rules as well. Then how is it that these are not called
for every syscall? Could you point me to the code where the evaluation
happens only once?

2. Also, do file watches only involve the open system call family (open,
openat etc). The man page implies the same, so just wanted to confirm.

I assume -w /etc -p wa is the same as -a always,exit -S open -S openat -F
dir=/etc?

Please correct any wrong assumption I may have as well.

Regards

--000000000000fbee2a05f49b77a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Everyone,<br><br>I wanted some help in better understan=
ding the workflow of file system auditing(watch rules) vs Syscall Auditing(=
syscall rules). I know in general file system auditing does not have the sa=
me performance impact as syscall auditing, even though both make use of sys=
call exits for their evaluation.<div><br></div><div><br></div><div><font fa=
ce=3D"arial, sans-serif">From the manpage - &quot;<span style=3D"color:rgb(=
68,68,68)">Unlike most syscall auditing rules, watches do not impact perfor=
mance based on the number of rules sent to the kernel.&quot;</span></font><=
/div><div><font face=3D"arial, sans-serif"><span style=3D"color:rgb(68,68,6=
8)"><br></span></font></div><div><font face=3D"arial, sans-serif"><span sty=
le=3D"color:rgb(68,68,68)">From a previous thread, I found this excerpt reg=
arding file watch rules vs sycall rules -=C2=A0<br></span></font><span styl=
e=3D"color:rgb(66,66,66);font-size:12.8px;white-space:pre-wrap"><font face=
=3D"Roboto Mono, monospace">
</font><font face=3D"arial, sans-serif">&quot;The reason it doesn&#39;t hav=
e performance impact like normal syscall rules is </font></span></div><span=
 style=3D"color:rgb(66,66,66);font-size:12.8px;white-space:pre-wrap"><font =
face=3D"arial, sans-serif">because it gets moved to a list that is not eval=
uated every syscall. A normal=20
syscall rule will get evaluated for every syscall because it has to see if =
the=20
syscall number is of interest and then it checks the next rule.&quot;</font=
></span><div><font color=3D"#424242" face=3D"arial, sans-serif"><span style=
=3D"font-size:12.8px;white-space:pre-wrap"><br></span></font></div><div><fo=
nt color=3D"#424242" face=3D"arial, sans-serif"><span style=3D"font-size:12=
.8px;white-space:pre-wrap">Based on this I had a couple of questions:</span=
></font></div><div><font color=3D"#424242" face=3D"arial, sans-serif"><span=
 style=3D"font-size:12.8px;white-space:pre-wrap"><br></span></font></div><d=
iv><font color=3D"#424242" face=3D"arial, sans-serif"><span style=3D"font-s=
ize:12.8px;white-space:pre-wrap"> For normal syscall rules, the evaluation =
happens as </span></font><a href=3D"https://elixir.bootlin.com/linux/v6.1.1=
0/C/ident/__audit_syscall_exit" style=3D"font-family:&quot;Ubuntu Mono&quot=
;,monospace;font-size:0.9em;background:linear-gradient(rgba(0,0,0,0) 10%,rg=
b(244,246,255) 10%,rgb(244,246,255) 90%,rgba(0,0,0,0) 90%);box-sizing:inher=
it;color:inherit;text-decoration-line:none;font-weight:700;border-radius:0.=
2em">__audit_syscall_exit</a>=C2=A0calls audit_filter_syscall<br>(<a href=
=3D"https://elixir.bootlin.com/linux/v6.1.10/source/kernel/auditsc.c#L841">=
https://elixir.bootlin.com/linux/v6.1.10/source/kernel/auditsc.c#L841</a>)<=
br><br>Here, we check if the syscall is of interest or not in the=C2=A0<a h=
ref=3D"https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_in_mask" styl=
e=3D"font-family:&quot;Ubuntu Mono&quot;,monospace;font-size:0.9em;backgrou=
nd:linear-gradient(rgba(0,0,0,0) 10%,rgb(244,246,255) 10%,rgb(244,246,255) =
90%,rgba(0,0,0,0) 90%);box-sizing:inherit;color:inherit;text-decoration-lin=
e:none;font-weight:700;border-radius:0.2em">audit_in_mask</a>=C2=A0function=
. Only if the syscall is of interest do we proceed with examining the task =
and return on the first rule match.</div><div><br></div><div>1. What is the=
 process or code path for watch rules?=C2=A0<a href=3D"https://elixir.bootl=
in.com/linux/v6.1.10/C/ident/audit_filter_syscall" style=3D"font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;font-size:0.9em;background:linear-gradient(r=
gba(0,0,0,0) 10%,rgb(244,246,255) 10%,rgb(244,246,255) 90%,rgba(0,0,0,0) 90=
%);box-sizing:inherit;color:inherit;text-decoration-line:none;font-weight:7=
00;border-radius:0.2em;border-bottom:1px dotted rgb(0,0,0)">audit_filter_sy=
scall</a>=C2=A0is called for watch rules as well. Then how is it that these=
 are not called for every syscall? Could you point me to the code where the=
 evaluation happens only once?<br><br>2. Also, do file watches only involve=
 the open system call family (open, openat etc). The man page implies the s=
ame, so just wanted to confirm.<br><br>I assume -w /etc -p wa is the same a=
s -a always,exit -S open -S openat -F dir=3D/etc?</div><div><br></div><div>=
Please correct any wrong assumption I may have as well.<br><br>Regards<br><=
br><br><br><div><br></div></div></div>

--000000000000fbee2a05f49b77a4--

--===============8374290242724846150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============8374290242724846150==--

