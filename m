Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30B696F13
	for <lists+linux-audit@lfdr.de>; Tue, 14 Feb 2023 22:15:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676409350;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yNzgqlUZIR4ECkffYUMukwInEd7kBIIOP/QrmsY7iuM=;
	b=FVoN5l6fn/wz/OSEsFhBNrqTBH3PukPY1cAhts7dO4/zw5Kksys2683bA0T4d6owLkS52+
	7GUIuaRpMoCrBQ61WrWixnbe80e7wygGEOB64sSvl0AtUYrrTGcEo6nP3YWnBZ1DY9dyzA
	80pLnZOMkxKMtHOeK8Zt0Iyz/Zz/AYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-fWpP1pMoOdCnCOLviuGeag-1; Tue, 14 Feb 2023 16:15:46 -0500
X-MC-Unique: fWpP1pMoOdCnCOLviuGeag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18B0A811E6E;
	Tue, 14 Feb 2023 21:15:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62F522166B26;
	Tue, 14 Feb 2023 21:15:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E8AC19465A3;
	Tue, 14 Feb 2023 21:15:38 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2BEF1946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 14 Feb 2023 20:56:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A18B140C10FA; Tue, 14 Feb 2023 20:56:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9980040C1423
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 20:56:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A5F1C041AB
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 20:56:14 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-ZBLob7kgNCGftr0XfEoNgw-1; Tue, 14 Feb 2023 15:56:10 -0500
X-MC-Unique: ZBLob7kgNCGftr0XfEoNgw-1
Received: by mail-qt1-f178.google.com with SMTP id h24so19415141qtr.0;
 Tue, 14 Feb 2023 12:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pCsnkBTJZOlG3xB8xnVBSto15mrzq+efjXuj2eLpGKs=;
 b=bvJQeY9ZH3vSyROF4S7quZIyvvLkBJ3dW0/KaZlDMHGiC21t0gm31m1Y+fpM8sCnxe
 D4rzUcHlSSBtT2GWp6k/dNpEwaQnXBU61lWPlW46ncPYeb51Er0Fv6bHDx2JaoukvEn5
 IGuq7cRUI5m30gvl/Gb0ZL1Fg726ei7j3nH7i0X9tYGhuna0j+PLwhWq7lG8oWFi0LLL
 xb46PsPM061OMvPy9c7Ii3SjW/3oB6foH7AGvoauTwY1PGJQnmI1a5i/JM3eVzVRCWyx
 qlLcC/z8rz+buQG1vmH4d2XteL7Qy0rZ4i4tcMvEiPL66qWC+ThtR42hYaJLIuD27v+t
 OIAw==
X-Gm-Message-State: AO0yUKWH+etkcv8zLVBYVh/teJOO0gJ1OmZ5v4z5lSPDbVgQJ+HMifaj
 Iu/aqWjiYUzFJniO5NiwJfnpgIVJFhe62JBCTGPFC33p
X-Google-Smtp-Source: AK7set/ee/tLcyMb8BhvxLc6Zal9Vdn0ZqKjU/wWYAdi/oDVt11XEtwP10rVTcz4+EhLYjMZ2kF3kY3a3PDfdfbph54=
X-Received: by 2002:a05:622a:5d1:b0:3b9:ceb2:210b with SMTP id
 d17-20020a05622a05d100b003b9ceb2210bmr487975qtb.287.1676408169633; Tue, 14
 Feb 2023 12:56:09 -0800 (PST)
MIME-Version: 1.0
References: <CAJcJf=TSvQxtFxNTkizfk_B1Y2WxE60Ct8HzHkt8RWhKMLnpUQ@mail.gmail.com>
 <4814542.31r3eYUQgx@x2>
In-Reply-To: <4814542.31r3eYUQgx@x2>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Tue, 14 Feb 2023 14:55:58 -0600
Message-ID: <CAJcJf=R4KgO_LwBfqgkFRKK+zJrth=CN1wvu1wqaEupaS_q_ww@mail.gmail.com>
Subject: Re: Clarification Around File System Auditing
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 14 Feb 2023 21:15:35 +0000
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
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7043427008801133627=="

--===============7043427008801133627==
Content-Type: multipart/alternative; boundary="000000000000731af705f4af31d5"

--000000000000731af705f4af31d5
Content-Type: text/plain; charset="UTF-8"

Thanks for the reply.
I was trying to evaluate the same via Flamegraphs and what I noticed was
that :

1. Despite deleting all rules (auditctl -D), there were still calls to
audit_filter_syscall() on each syscall. I assume this is because syscall
auditing is enabled and despite no rules, there still will be some
performance impact and calls to syscall filtering functions on each syscall.

2. For a single watch rule as well without any syscall rules, I could see
calls to audit_filter_syscall() followed by audit_filter_rules() for
unrelated syscalls such as futex() and recvmsg() - not present in
include/asm-generic/audit_*.h
Why would these functions be called for a single watch rule for syscalls
unrelated to the permissions?



On Tue, Feb 14, 2023 at 8:29 AM Steve Grubb <sgrubb@redhat.com> wrote:

> Hello,
>
> On Monday, February 13, 2023 4:24:02 PM EST Amjad Gabbar wrote:
> > I wanted some help in better understanding the workflow of file system
> > auditing(watch rules) vs Syscall Auditing(syscall rules). I know in
> general
> > file system auditing does not have the same performance impact as syscall
> > auditing, even though both make use of syscall exits for their
> evaluation.
> >
> >
> > From the manpage - "Unlike most syscall auditing rules, watches do not
> > impact performance based on the number of rules sent to the kernel."
> >
> > From a previous thread, I found this excerpt regarding file watch rules
> vs
> > sycall rules -
> >
> > "The reason it doesn't have performance impact like normal syscall rules
> is
> > because it gets moved to a list that is not evaluated every syscall. A
> > normal syscall rule will get evaluated for every syscall because it has
> to
> > see if the syscall number is of interest and then it checks the next
> > rule."
> >
> > Based on this I had a couple of questions:
> >
> > For normal syscall rules, the evaluation happens as __audit_syscall_exit
> > <https://elixir.bootlin.com/linux/v6.1.10/C/ident/__audit_syscall_exit>
> > calls audit_filter_syscall
> > (https://elixir.bootlin.com/linux/v6.1.10/source/kernel/auditsc.c#L841)
> >
> > Here, we check if the syscall is of interest or not in the audit_in_mask
> > <https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_in_mask>
> function.
> > Only if the syscall is of interest do we proceed with examining the task
> > and return on the first rule match.
> >
> > 1. What is the process or code path for watch rules? audit_filter_syscall
> > <https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_filter_syscall>
> is
> > called for watch rules as well. Then how is it that these are not called
> > for every syscall? Could you point me to the code where the evaluation
> > happens only once?
>
> There is a file, kernel/audit_watch.c, that implements the interface
> between
> audit and fsnotify. You would want to learn how fsnotify works to
> understand
> how it avoids the syscall filter.
>
> > 2. Also, do file watches only involve the open system call family (open,
> > openat etc). The man page implies the same, so just wanted to confirm.
> >
> > I assume -w /etc -p wa is the same as -a always,exit -S open -S openat -F
> > dir=/etc?
>
> It depends on the flag passed for perm as to what syscall it wants. See:
>
> include/asm-generic/audit_*.h
>
> -Steve
>
>
>

--000000000000731af705f4af31d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the reply.</div><div dir=3D"auto">I was trying=
 to evaluate the same via Flamegraphs and what I noticed was that :</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">1. Despite deleting all rules (=
auditctl -D), there were still calls to audit_filter_syscall() on each sysc=
all. I assume this is because syscall auditing is enabled and despite no ru=
les, there still will be some performance impact and calls to syscall filte=
ring functions on each syscall.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">2. For a single watch rule as well without any syscall rules, I c=
ould see calls to audit_filter_syscall() followed by audit_filter_rules() f=
or unrelated syscalls such as futex() and recvmsg() - not present in=C2=A0<=
span>include/asm-generic/audit_*.h</span></div><div dir=3D"auto"><span>Why =
would these functions be called for a single watch rule for syscalls unrela=
ted to the permissions?</span></div><div dir=3D"auto"><span><br></span></di=
v><div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 8:29 AM Steve Grubb &=
lt;<a href=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)" dir=3D"auto">Hello,<br>
<br>
On Monday, February 13, 2023 4:24:02 PM EST Amjad Gabbar wrote:<br>
&gt; I wanted some help in better understanding the workflow of file system=
<br>
&gt; auditing(watch rules) vs Syscall Auditing(syscall rules). I know in ge=
neral<br>
&gt; file system auditing does not have the same performance impact as sysc=
all<br>
&gt; auditing, even though both make use of syscall exits for their evaluat=
ion.<br>
&gt; <br>
&gt; <br>
&gt; From the manpage - &quot;Unlike most syscall auditing rules, watches d=
o not<br>
&gt; impact performance based on the number of rules sent to the kernel.&qu=
ot;<br>
&gt; <br>
&gt; From a previous thread, I found this excerpt regarding file watch rule=
s vs<br>
&gt; sycall rules -<br>
&gt;<br>
&gt; &quot;The reason it doesn&#39;t have performance impact like normal sy=
scall rules is<br>
&gt; because it gets moved to a list that is not evaluated every syscall. A=
<br>
&gt; normal syscall rule will get evaluated for every syscall because it ha=
s to<br>
&gt; see if the syscall number is of interest and then it checks the next<b=
r>
&gt; rule.&quot;<br>
&gt; <br>
&gt; Based on this I had a couple of questions:<br>
&gt; <br>
&gt; For normal syscall rules, the evaluation happens as __audit_syscall_ex=
it<br>
&gt; &lt;<a href=3D"https://elixir.bootlin.com/linux/v6.1.10/C/ident/__audi=
t_syscall_exit" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin=
.com/linux/v6.1.10/C/ident/__audit_syscall_exit</a>&gt;<br>
&gt; calls audit_filter_syscall<br>
&gt; (<a href=3D"https://elixir.bootlin.com/linux/v6.1.10/source/kernel/aud=
itsc.c#L841" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin.co=
m/linux/v6.1.10/source/kernel/auditsc.c#L841</a>)<br>
&gt; <br>
&gt; Here, we check if the syscall is of interest or not in the audit_in_ma=
sk<br>
&gt; &lt;<a href=3D"https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_=
in_mask" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin.com/li=
nux/v6.1.10/C/ident/audit_in_mask</a>&gt; function.<br>
&gt; Only if the syscall is of interest do we proceed with examining the ta=
sk<br>
&gt; and return on the first rule match.<br>
&gt; <br>
&gt; 1. What is the process or code path for watch rules? audit_filter_sysc=
all<br>
&gt; &lt;<a href=3D"https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_=
filter_syscall" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin=
.com/linux/v6.1.10/C/ident/audit_filter_syscall</a>&gt; is<br>
&gt; called for watch rules as well. Then how is it that these are not call=
ed<br>
&gt; for every syscall? Could you point me to the code where the evaluation=
<br>
&gt; happens only once?<br>
<br>
There is a file, kernel/audit_watch.c, that implements the interface betwee=
n <br>
audit and fsnotify. You would want to learn how fsnotify works to understan=
d <br>
how it avoids the syscall filter.<br>
<br>
&gt; 2. Also, do file watches only involve the open system call family (ope=
n,<br>
&gt; openat etc). The man page implies the same, so just wanted to confirm.=
<br>
&gt; <br>
&gt; I assume -w /etc -p wa is the same as -a always,exit -S open -S openat=
 -F<br>
&gt; dir=3D/etc?<br>
<br>
It depends on the flag passed for perm as to what syscall it wants. See:<br=
>
<br>
include/asm-generic/audit_*.h<br>
<br>
-Steve<br>
<br>
<br>
</blockquote></div></div>

--000000000000731af705f4af31d5--

--===============7043427008801133627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============7043427008801133627==--

