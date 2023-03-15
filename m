Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E94156BBDFA
	for <lists+linux-audit@lfdr.de>; Wed, 15 Mar 2023 21:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678912409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=04U4fey18G9yiMnZgwlQkFSFFoVUQWBVbR+79duyTfA=;
	b=MaHQOosQJhk82TThhmEJehEJpjj5/0pbX6hfgOZ6gaj+XawMCnGQ9QamaJt7tSBccSyl08
	GP5+S84zooXqVl3ugqvf6a7K5F2kzdepxPsp+JY/84xM4kT8awSpJes83/bPxaNGAtU3zY
	5JLQ+/STb4J44OIgYFoAhP9OoEgMAPw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-9iBOrBQnPp2P5XOQJq_j6A-1; Wed, 15 Mar 2023 16:33:28 -0400
X-MC-Unique: 9iBOrBQnPp2P5XOQJq_j6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E7FF3C0ED47;
	Wed, 15 Mar 2023 20:33:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7167E18EC7;
	Wed, 15 Mar 2023 20:33:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D36F61946A47;
	Wed, 15 Mar 2023 20:33:07 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A70C81946597 for <linux-audit@listman.corp.redhat.com>;
 Wed, 15 Mar 2023 20:30:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40338C017D7; Wed, 15 Mar 2023 20:30:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F6AC158C2
 for <linux-audit@redhat.com>; Wed, 15 Mar 2023 20:30:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15A15185A7A2
 for <linux-audit@redhat.com>; Wed, 15 Mar 2023 20:30:16 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-hJH9cqHzMba5d5f5z9AbJw-1; Wed, 15 Mar 2023 16:30:11 -0400
X-MC-Unique: hJH9cqHzMba5d5f5z9AbJw-1
Received: by mail-qv1-f50.google.com with SMTP id o3so17491578qvr.1;
 Wed, 15 Mar 2023 13:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678912211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ROb8qrSX2bod0s4xTuP8E4y5RnbLJGv0ic+OIiw9E/k=;
 b=yO+C10mp/3UtmY9gE+xRn7Ae8fOwkaAGXzI0Rd2MtgyaYT9Izk9gBDGbisTe60TlIa
 JmDsUwfWY5T4zh18cNGpVjpy6yLPejEqmUyk/FN/kdWOI1b81MYXbUEJLAg77eiUfaZL
 KYuMr4OcEMBi+0Ijnd9P0do43ZVcC7XwDGqFd1QfbB2uhRIw90IvemJF5oUdqqkUEUI2
 m9/6O/weAoZKggYShG+p0ob2sfhgj0wbmCVmn9nO17AbSN/GL2Ic9pEgOhH+WEF18U7y
 /KPZTzdrDWIecUvnOlKzyx6cOfHM8PoAO+ZjIwsVQbZjXNhkXCc1SexjdNyjxUVxP2At
 unYw==
X-Gm-Message-State: AO0yUKWBVkuBHJZdFM4BTb2FvOXytCsdzPijIVcX/LER51U0HjQ/oeyX
 OKxk53C3L+6FPwd5XBs1xephHB4qhQoU/Mqosnp4ANLRpAf0xg==
X-Google-Smtp-Source: AK7set8rNMvsX93EIoJ3YtgVhVSD3UPThrkxO43yg6NSpLpygSOhbD47xHVl+W7PBQTWg3KvGrJRzdL1D1UDU07l0s8=
X-Received: by 2002:ad4:4e74:0:b0:56e:9f09:ee58 with SMTP id
 ec20-20020ad44e74000000b0056e9f09ee58mr4216141qvb.8.1678912210758; Wed, 15
 Mar 2023 13:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcJf=TSvQxtFxNTkizfk_B1Y2WxE60Ct8HzHkt8RWhKMLnpUQ@mail.gmail.com>
 <4814542.31r3eYUQgx@x2>
 <CAJcJf=R4KgO_LwBfqgkFRKK+zJrth=CN1wvu1wqaEupaS_q_ww@mail.gmail.com>
 <2289859.ElGaqSPkdT@x2> <ZAunHiMZXgQkJW9a@madcap2.tricolour.ca>
In-Reply-To: <ZAunHiMZXgQkJW9a@madcap2.tricolour.ca>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Wed, 15 Mar 2023 15:29:59 -0500
Message-ID: <CAJcJf=T5FJr05f_HDi8=_QWxPXCcJ7bqfu3tBeWFq6y-Qsac-g@mail.gmail.com>
Subject: Re: Clarification Around File System Auditing
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Wed, 15 Mar 2023 20:33:06 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2631710904690423877=="

--===============2631710904690423877==
Content-Type: multipart/alternative; boundary="000000000000ee729b05f6f635a9"

--000000000000ee729b05f6f635a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yup....I was able to find the dummy check you are referring to and the
audit_reset_context() that is called next(which immediately exits in case
of dummy).
Thanks for the help folks....have a much better understanding of how the
audit context is allocated on enabling syscall auditing and the whole flow
post that.

Had just 1 question wrt watches. IIUC, for watch rules we evaluate all
syscalls (Snippet from audit-userspace:
https://github.com/linux-audit/audit-userspace/blob/1482cec74f2d9472f81dd4f=
0533484bd0c26decd/lib/libaudit.c#L805
).
But based on the permissions in the rule, we evaluate if the syscall
belongs to a specific Audit Class using audit_match_class() and only log if
the syscalls match/ are part of the class. This also explains why I see
audit_filter_rules() called for watches even if the syscall being performed
is not at all related to file system auditing.


   1. I was wondering why do we not automatically identify if the syscall
   is of interest or not in audit_in_mask() itself based on the rule
   permissions of the watch? In this way we would avoid the additional
   overhead of each syscall going into audit_filter_rules() and then
   evaluating on the AUDIT_PERM case as well.


Currently a watch rule for "wa" permissions for /etc is similar to :
-a always,exit -F arch=3Db64 -S all -F dir=3D/etc -F perm=3Dwa -k ETC_WATCH

We only log if the syscall is part of the WRITE and ATTR permissions set.
Instead what I was suggesting was something like this:

-a always,exit -F arch=3Db64 -S <all syscalls part of the write and attr
classes> -F dir=3D/etc  -k ETC_WATCH

Please correct me if my understanding in any of the above is incorrect.

On Fri, Mar 10, 2023 at 3:54=E2=80=AFPM Richard Guy Briggs <rgb@redhat.com>=
 wrote:

> On 2023-02-17 16:50, Steve Grubb wrote:
> > Hello,
> >
> > On Tuesday, February 14, 2023 3:55:58 PM EST Amjad Gabbar wrote:
> > > Thanks for the reply.
> > > I was trying to evaluate the same via Flamegraphs and what I noticed
> was
> > > that :
> > >
> > > 1. Despite deleting all rules (auditctl -D), there were still calls t=
o
> > > audit_filter_syscall() on each syscall. I assume this is because
> syscall
> > > auditing is enabled and despite no rules, there still will be some
> > > performance impact and calls to syscall filtering functions on each
> > > syscall.
> >
> > Yes.
> >
> > > 2. For a single watch rule as well without any syscall rules, I could
> see
> > > calls to audit_filter_syscall() followed by audit_filter_rules() for
> > > unrelated syscalls such as futex() and recvmsg() - not present in
> > > include/asm-generic/audit_*.h
> > > Why would these functions be called for a single watch rule for
> syscalls
> > > unrelated to the permissions?
> >
> > If auditing is enabled, it will go into the syscall filter for *any*
> syscall.
> > It will go into __audit_syscall_exit for every syscall. If there is an
> audit
> > context, it will go into audit_filter_syscall. The documentation in the
> > comments above these functions is informative.
> >
> > My guess is that this code path might benefit from adding a list_empty
> check.
> > A long time ago, I think we kept a variable that denoted if there were
> any
> > rules and short-circuited if none.
>
> There is essentially an empty list check in __audit_syscall_exit() with
> the dummy check, based on the number of syscall (or io_uring) rules in
> place tracked in audit_n_rules.  Unfortunately, we can't bail from
> __audit_syscall_entry() right after setting dummy because other
> hardwired records can cancel the dummy flag.
>
> > -Steve
> >
> > > On Tue, Feb 14, 2023 at 8:29 AM Steve Grubb <sgrubb@redhat.com> wrote=
:
> > > > Hello,
> > > >
> > > > On Monday, February 13, 2023 4:24:02 PM EST Amjad Gabbar wrote:
> > > > > I wanted some help in better understanding the workflow of file
> system
> > > > > auditing(watch rules) vs Syscall Auditing(syscall rules). I know =
in
> > > >
> > > > general
> > > >
> > > > > file system auditing does not have the same performance impact as
> > > > > syscall
> > > > > auditing, even though both make use of syscall exits for their
> > > >
> > > > evaluation.
> > > >
> > > > > From the manpage - "Unlike most syscall auditing rules, watches d=
o
> not
> > > > > impact performance based on the number of rules sent to the
> kernel."
> > > > >
> > > > > From a previous thread, I found this excerpt regarding file watch
> rules
> > > >
> > > > vs
> > > >
> > > > > sycall rules -
> > > > >
> > > > > "The reason it doesn't have performance impact like normal syscal=
l
> > > > > rules
> > > >
> > > > is
> > > >
> > > > > because it gets moved to a list that is not evaluated every
> syscall. A
> > > > > normal syscall rule will get evaluated for every syscall because
> it has
> > > >
> > > > to
> > > >
> > > > > see if the syscall number is of interest and then it checks the
> next
> > > > > rule."
> > > > >
> > > > > Based on this I had a couple of questions:
> > > > >
> > > > > For normal syscall rules, the evaluation happens as
> > > > > __audit_syscall_exit
> > > > > <
> https://elixir.bootlin.com/linux/v6.1.10/C/ident/__audit_syscall_exit>
> > > > > calls audit_filter_syscall
> > > > > (
> https://elixir.bootlin.com/linux/v6.1.10/source/kernel/auditsc.c#L841)
> > > > >
> > > > > Here, we check if the syscall is of interest or not in the
> > > > > audit_in_mask
> > > > > <https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_in_mask>
> > > >
> > > > function.
> > > >
> > > > > Only if the syscall is of interest do we proceed with examining t=
he
> > > > > task
> > > > > and return on the first rule match.
> > > > >
> > > > > 1. What is the process or code path for watch rules?
> > > > > audit_filter_syscall
> > > > > <
> https://elixir.bootlin.com/linux/v6.1.10/C/ident/audit_filter_syscall>
> > > >
> > > > is
> > > >
> > > > > called for watch rules as well. Then how is it that these are not
> > > > > called
> > > > > for every syscall? Could you point me to the code where the
> evaluation
> > > > > happens only once?
> > > >
> > > > There is a file, kernel/audit_watch.c, that implements the interfac=
e
> > > > between
> > > > audit and fsnotify. You would want to learn how fsnotify works to
> > > > understand
> > > > how it avoids the syscall filter.
> > > >
> > > > > 2. Also, do file watches only involve the open system call family
> > > > > (open,
> > > > > openat etc). The man page implies the same, so just wanted to
> confirm.
> > > > >
> > > > > I assume -w /etc -p wa is the same as -a always,exit -S open -S
> openat
> > > > > -F
> > > > > dir=3D/etc?
> > > >
> > > > It depends on the flag passed for perm as to what syscall it wants.
> See:
> > > >
> > > > include/asm-generic/audit_*.h
> > > >
> > > > -Steve
> >
> >
> >
> >
> > --
> > Linux-audit mailing list
> > Linux-audit@redhat.com
> > https://listman.redhat.com/mailman/listinfo/linux-audit
> >
>
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
>
>

--000000000000ee729b05f6f635a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yup....I was able to find the dummy check you are referrin=
g to and the audit_reset_context() that is called next(which immediately ex=
its in case of dummy).<div>Thanks for the help folks....have a much better =
understanding=C2=A0of how the audit context is allocated on enabling syscal=
l auditing and the whole flow post that.</div><div><br></div><div>Had just =
1 question wrt watches. IIUC, for watch rules we evaluate all syscalls (Sni=
ppet from audit-userspace: <a href=3D"https://github.com/linux-audit/audit-=
userspace/blob/1482cec74f2d9472f81dd4f0533484bd0c26decd/lib/libaudit.c#L805=
">https://github.com/linux-audit/audit-userspace/blob/1482cec74f2d9472f81dd=
4f0533484bd0c26decd/lib/libaudit.c#L805</a>).</div><div>But based on the pe=
rmissions in the rule, we evaluate if the syscall belongs to a specific Aud=
it Class using audit_match_class() and only log if the syscalls match/ are =
part of the class. This also explains why I see audit_filter_rules() called=
 for watches even if the syscall being performed is not at all related to f=
ile system auditing.</div><div><br></div><div><ol><li>I was wondering why d=
o we not automatically identify if the syscall is of interest or not in=C2=
=A0audit_in_mask() itself based on the rule permissions of the watch? In th=
is way we would avoid the additional overhead of each syscall going into au=
dit_filter_rules() and then evaluating on the AUDIT_PERM case as well.</li>=
</ol></div><div><br></div><div>Currently a watch rule for &quot;wa&quot; pe=
rmissions for /etc is similar to :</div><div>-a always,exit -F arch=3Db64 -=
S all -F dir=3D/etc -F perm=3Dwa -k ETC_WATCH</div><div><br></div><div>We o=
nly log if the syscall is part of the WRITE and ATTR permissions set. Inste=
ad what I was suggesting was something like this:<br><br></div><div>-a alwa=
ys,exit -F arch=3Db64 -S &lt;all syscalls part of the write and attr classe=
s&gt; -F dir=3D/etc=C2=A0 -k ETC_WATCH</div><div><br></div><div>Please corr=
ect me if my understanding in any of the above is incorrect.</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, M=
ar 10, 2023 at 3:54=E2=80=AFPM Richard Guy Briggs &lt;<a href=3D"mailto:rgb=
@redhat.com">rgb@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On 2023-02-17 16:50, Steve Grubb wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; On Tuesday, February 14, 2023 3:55:58 PM EST Amjad Gabbar wrote:<br>
&gt; &gt; Thanks for the reply.<br>
&gt; &gt; I was trying to evaluate the same via Flamegraphs and what I noti=
ced was<br>
&gt; &gt; that :<br>
&gt; &gt; <br>
&gt; &gt; 1. Despite deleting all rules (auditctl -D), there were still cal=
ls to<br>
&gt; &gt; audit_filter_syscall() on each syscall. I assume this is because =
syscall<br>
&gt; &gt; auditing is enabled and despite no rules, there still will be som=
e<br>
&gt; &gt; performance impact and calls to syscall filtering functions on ea=
ch<br>
&gt; &gt; syscall.<br>
&gt; <br>
&gt; Yes.<br>
&gt; <br>
&gt; &gt; 2. For a single watch rule as well without any syscall rules, I c=
ould see<br>
&gt; &gt; calls to audit_filter_syscall() followed by audit_filter_rules() =
for<br>
&gt; &gt; unrelated syscalls such as futex() and recvmsg() - not present in=
<br>
&gt; &gt; include/asm-generic/audit_*.h<br>
&gt; &gt; Why would these functions be called for a single watch rule for s=
yscalls<br>
&gt; &gt; unrelated to the permissions?<br>
&gt; <br>
&gt; If auditing is enabled, it will go into the syscall filter for *any* s=
yscall. <br>
&gt; It will go into __audit_syscall_exit for every syscall. If there is an=
 audit <br>
&gt; context, it will go into audit_filter_syscall. The documentation in th=
e <br>
&gt; comments above these functions is informative.<br>
&gt; <br>
&gt; My guess is that this code path might benefit from adding a list_empty=
 check. <br>
&gt; A long time ago, I think we kept a variable that denoted if there were=
 any <br>
&gt; rules and short-circuited if none.<br>
<br>
There is essentially an empty list check in __audit_syscall_exit() with<br>
the dummy check, based on the number of syscall (or io_uring) rules in<br>
place tracked in audit_n_rules.=C2=A0 Unfortunately, we can&#39;t bail from=
<br>
__audit_syscall_entry() right after setting dummy because other<br>
hardwired records can cancel the dummy flag.<br>
<br>
&gt; -Steve<br>
&gt; <br>
&gt; &gt; On Tue, Feb 14, 2023 at 8:29 AM Steve Grubb &lt;<a href=3D"mailto=
:sgrubb@redhat.com" target=3D"_blank">sgrubb@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Monday, February 13, 2023 4:24:02 PM EST Amjad Gabbar wro=
te:<br>
&gt; &gt; &gt; &gt; I wanted some help in better understanding the workflow=
 of file system<br>
&gt; &gt; &gt; &gt; auditing(watch rules) vs Syscall Auditing(syscall rules=
). I know in<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; general<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; file system auditing does not have the same performance=
 impact as<br>
&gt; &gt; &gt; &gt; syscall<br>
&gt; &gt; &gt; &gt; auditing, even though both make use of syscall exits fo=
r their<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; evaluation.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; From the manpage - &quot;Unlike most syscall auditing r=
ules, watches do not<br>
&gt; &gt; &gt; &gt; impact performance based on the number of rules sent to=
 the kernel.&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; From a previous thread, I found this excerpt regarding =
file watch rules<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; vs<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; sycall rules -<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &quot;The reason it doesn&#39;t have performance impact=
 like normal syscall<br>
&gt; &gt; &gt; &gt; rules<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; is<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; because it gets moved to a list that is not evaluated e=
very syscall. A<br>
&gt; &gt; &gt; &gt; normal syscall rule will get evaluated for every syscal=
l because it has<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; to<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; see if the syscall number is of interest and then it ch=
ecks the next<br>
&gt; &gt; &gt; &gt; rule.&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Based on this I had a couple of questions:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; For normal syscall rules, the evaluation happens as<br>
&gt; &gt; &gt; &gt; __audit_syscall_exit<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"https://elixir.bootlin.com/linux/v6.1.10=
/C/ident/__audit_syscall_exit" rel=3D"noreferrer" target=3D"_blank">https:/=
/elixir.bootlin.com/linux/v6.1.10/C/ident/__audit_syscall_exit</a>&gt;<br>
&gt; &gt; &gt; &gt; calls audit_filter_syscall<br>
&gt; &gt; &gt; &gt; (<a href=3D"https://elixir.bootlin.com/linux/v6.1.10/so=
urce/kernel/auditsc.c#L841" rel=3D"noreferrer" target=3D"_blank">https://el=
ixir.bootlin.com/linux/v6.1.10/source/kernel/auditsc.c#L841</a>)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Here, we check if the syscall is of interest or not in =
the<br>
&gt; &gt; &gt; &gt; audit_in_mask<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"https://elixir.bootlin.com/linux/v6.1.10=
/C/ident/audit_in_mask" rel=3D"noreferrer" target=3D"_blank">https://elixir=
.bootlin.com/linux/v6.1.10/C/ident/audit_in_mask</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; function.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Only if the syscall is of interest do we proceed with e=
xamining the<br>
&gt; &gt; &gt; &gt; task<br>
&gt; &gt; &gt; &gt; and return on the first rule match.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; 1. What is the process or code path for watch rules?<br=
>
&gt; &gt; &gt; &gt; audit_filter_syscall<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"https://elixir.bootlin.com/linux/v6.1.10=
/C/ident/audit_filter_syscall" rel=3D"noreferrer" target=3D"_blank">https:/=
/elixir.bootlin.com/linux/v6.1.10/C/ident/audit_filter_syscall</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; is<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; called for watch rules as well. Then how is it that the=
se are not<br>
&gt; &gt; &gt; &gt; called<br>
&gt; &gt; &gt; &gt; for every syscall? Could you point me to the code where=
 the evaluation<br>
&gt; &gt; &gt; &gt; happens only once?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; There is a file, kernel/audit_watch.c, that implements the i=
nterface<br>
&gt; &gt; &gt; between<br>
&gt; &gt; &gt; audit and fsnotify. You would want to learn how fsnotify wor=
ks to<br>
&gt; &gt; &gt; understand<br>
&gt; &gt; &gt; how it avoids the syscall filter.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; 2. Also, do file watches only involve the open system c=
all family<br>
&gt; &gt; &gt; &gt; (open,<br>
&gt; &gt; &gt; &gt; openat etc). The man page implies the same, so just wan=
ted to confirm.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I assume -w /etc -p wa is the same as -a always,exit -S=
 open -S openat<br>
&gt; &gt; &gt; &gt; -F<br>
&gt; &gt; &gt; &gt; dir=3D/etc?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; It depends on the flag passed for perm as to what syscall it=
 wants. See:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; include/asm-generic/audit_*.h<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; -Steve<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Linux-audit mailing list<br>
&gt; <a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audi=
t@redhat.com</a><br>
&gt; <a href=3D"https://listman.redhat.com/mailman/listinfo/linux-audit" re=
l=3D"noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/listi=
nfo/linux-audit</a><br>
&gt; <br>
<br>
- RGB<br>
<br>
--<br>
Richard Guy Briggs &lt;<a href=3D"mailto:rgb@redhat.com" target=3D"_blank">=
rgb@redhat.com</a>&gt;<br>
Sr. S/W Engineer, Kernel Security, Base Operating Systems<br>
Remote, Ottawa, Red Hat Canada<br>
IRC: rgb, SunRaycer<br>
Voice: +1.647.777.2635, Internal: (81) 32635<br>
<br>
</blockquote></div>

--000000000000ee729b05f6f635a9--

--===============2631710904690423877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2631710904690423877==--

