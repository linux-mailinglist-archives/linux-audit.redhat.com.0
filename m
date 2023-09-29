Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8C7BD054
	for <lists+linux-audit@lfdr.de>; Sun,  8 Oct 2023 23:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696800894;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xiL/6OBG+Ka4fClcyAir7RylKJc0W3QOejoLd2shFJI=;
	b=JHZHQVDmpQrMBrMVEuBF3WSQidUdh8/8petLAisMfQLjS3+HFjvxH9dw9Bci9gAdyjdzSk
	8neDtxsyrk0iny+DzKBUdw4BMS2R/SSo4NfgKEAra/FiSuL3R/ZzIGqiikMLeyxRAeQr6P
	DmO6j/TdEDRi5Z3KTSc3eitfZbtZ6JU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-wHsrQ7esOJy5ckpi49Cm1A-1; Sun, 08 Oct 2023 17:34:41 -0400
X-MC-Unique: wHsrQ7esOJy5ckpi49Cm1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE8A43801EDE;
	Sun,  8 Oct 2023 21:34:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 713D61005B90;
	Sun,  8 Oct 2023 21:34:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D84C219465B7;
	Sun,  8 Oct 2023 21:34:29 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1184B1946586 for <linux-audit@listman.corp.redhat.com>;
 Fri, 29 Sep 2023 16:40:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 00DE3492B05; Fri, 29 Sep 2023 16:40:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDD77492C37
 for <linux-audit@redhat.com>; Fri, 29 Sep 2023 16:40:10 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6FF9811E7E
 for <linux-audit@redhat.com>; Fri, 29 Sep 2023 16:40:10 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-PMrDvTaJODy0bdVwpQUndQ-1; Fri, 29 Sep 2023 12:40:03 -0400
X-MC-Unique: PMrDvTaJODy0bdVwpQUndQ-1
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4180d962b68so73467781cf.1; 
 Fri, 29 Sep 2023 09:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696005602; x=1696610402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OznryqHa3CmRLyZ0RbeYz0tJ+Im4wKBDnSVdLq5507k=;
 b=vHA+/isEBfvmEOnwqpXok0Z9+oSaSRIIfqLoXHZQuYOZd674LK2L3XyP/K/Ry2B2RX
 eux02ZcpUmjbR1tkkGYEahrCX6XuZpTtt/YT336LTH7YD5vaS+UMj4b+k3waPIANhoad
 a2AsNo8aqPF3Akx2MBqGemmmDArankW0XemrPuraaUrRnOu5nuF1ol2cu1+RpSIQvNul
 4dyjdDPqI5j378QMJPQRXAL/aY+dlXUfRRzHqm4ynYK4wupdSXNphHmPw8KrTuDJ2eQz
 qIwuaLnpv1Z7kmgRnb1wo++a7kGL2PXzUSHYhavr2NxRLsMFRfKaLdspwKDEBXGnaLin
 fW0A==
X-Gm-Message-State: AOJu0Yxy2XwvWKKUuC1YyHv8v40lzoO3zjSzVyZhkydK9dxR75S5qP6I
 jmeisS4usxU0ukhXWT1A9+SsqwNhgyFfmFMDtdAG2SYj
X-Google-Smtp-Source: AGHT+IFZt3KFEDpbudwcE/LqL1wXew7x/h6jF7zoJKrTSH+J7oQuDdEtq5fZgaiZebng6vuBULxdqfG72DE1lb5Kjys=
X-Received: by 2002:a05:622a:199d:b0:418:bdf:f4b with SMTP id
 u29-20020a05622a199d00b004180bdf0f4bmr5137509qtc.6.1696005602281; Fri, 29 Sep
 2023 09:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <CAJcJf=RKAqp0PPQ2EmOZ5jJ6KGZ4rAvmabdDsg+MvkbmcomChA@mail.gmail.com>
 <4866749.31r3eYUQgx@x2> <3262512.44csPzL39Z@x2>
In-Reply-To: <3262512.44csPzL39Z@x2>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Fri, 29 Sep 2023 11:39:51 -0500
Message-ID: <CAJcJf=Ss2Fz3932cE+Fxf4rGMUrbNOPEZ1i3xAQmz_x+XbVbGg@mail.gmail.com>
Subject: Re: Sycall Rules vs Watch Rules
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Sun, 08 Oct 2023 21:34:29 +0000
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============7640820996097210896=="

--===============7640820996097210896==
Content-Type: multipart/alternative; boundary="000000000000760def0606821366"

--000000000000760def0606821366
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good. I will test this out.

Regards
Ali Adnan

On Thu, Sep 28, 2023 at 11:30 AM Steve Grubb <sgrubb@redhat.com> wrote:

> On Thursday, September 28, 2023 11:53:26 AM EDT Steve Grubb wrote:
> > On Thursday, September 21, 2023 4:02:49 PM EDT Amjad Gabbar wrote:
> > > > The best solution would be a kernel modification so that there are =
no
> > > > mismatched lists.
> > >
> > > I agree as well....This would be the cleanest solution. This would al=
so
> > > solve the userspace problem of maintaining different lists which can
> get
> > > out of hand fairly quickly.
> >
> > After looking into this, a kernel patch would also not work well. It ha=
s
> to
> > be arch specific
> >
> > > > I guess we can warn on that to rewrite in syscall notation.
> > >
> > > We certainly should. I think the user should know that there is a
> > > performance cost associated with watches and we should explicitly
> mention
> > > how it can be optimized in the manpages also. The reason being I am
> > > pretty sure, numerous users/repos still do make use of the -w notatio=
n
> > > and we do want to let them know the issue here. We also need to make
> > > quite a few changes to the manpages also regarding this. Because,
> > > initially even I was  very confused when reading the man pages and
> seeing
> > > the actual implementation of and results were not quite in sync.
> >
> > I have made the changes to the master and audit-3.1-maint branches.
> Please
> > everyone concerned give them tests. The short of it is that if you use
> the
> > '- w' notation for watches, it will remain the same and slower.
>
> Actually, ths is the one that draws the warning to urge people to migrate=
.
>
> > If you use
> > the syscall notation without "-F arch", you will get a warning that it
> > cannot be optimized without adding "-Farch".
>
> Actually, you won't in order to preserve intentional behavior.
>
> > If you add "-F arch", you
> > will possibly need one for both arches which means doubling the rules. =
If
> > you do not want to double the rules, you might place a syscall rule for
> > any 32 system call (21-no32bit.rules). Or you can leave it as is and no=
t
> > care. The sample rules and all man pages have been updated.
>
> I should have provided an example of what this means. If you have this ki=
nd
> of rule:
>
> -w /etc/shadow -p wa -k shadow
>
> And when applied draws a warning:
>
> # auditctl -w /etc/shadow -p wa -k shadow
> Old style watch rules are slower
>
> It should be rewritten as
>
> -a always,exit -F arch=3Db64 -F path=3D/etc/shadow -F perm=3Dwa -F key=3D=
shadow
>
> Then it looks like this when loaded:
>
> #auditctl -l
> -a always,exit -F arch=3Db64 -S
> open,bind,truncate,ftruncate,rename,mkdir,rmdir,creat,link,unlink,symlink=
,chmod,fchmod,chown,fchown,lchown,mknod,acct,swapon,quotactl,setxattr,lsetx=
attr,fsetxattr,removexattr,lremovexattr,fremovexattr,openat,mkdirat,mknodat=
,fchownat,unlinkat,renameat,linkat,symlinkat,fchmodat,fallocate,renameat2,o=
penat2
> -F path=3D/etc/shadow -F perm=3Dwa -F key=3Dshadow
>
> And to delete  the rule,
> auditctl -d always,exit -F arch=3Db64 -F path=3D/etc/shadow -F perm=3Dwa =
-F
> key=3Dshadow
>
> or the long way
>
> auditctl -d always,exit -F arch=3Db64 -S
> open,bind,truncate,ftruncate,rename,mkdir,rmdir,creat,link,unlink,symlink=
,chmod,fchmod,chown,fchown,lchown,mknod,acct,swapon,quotactl,setxattr,lsetx=
attr,fsetxattr,removexattr,lremovexattr,fremovexattr,openat,mkdirat,mknodat=
,fchownat,unlinkat,renameat,linkat,symlinkat,fchmodat,fallocate,renameat2,o=
penat2
> -F path=3D/etc/shadow -F perm=3Dwa -F key=3Dshadow
>
> Hopefully this is clearer what the change is.
>
> -Steve
>
>
>
>

--000000000000760def0606821366
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sounds good. I will test this out.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Ali Adnan</div>=
<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Sep 28, 2023 at 11:30 AM Steve Grubb &lt;<a href=3D"mailto:sgrubb@re=
dhat.com">sgrubb@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Thursday, September 28, 2023 11:53:26 AM EDT Steve Grubb wrote:<=
br>
&gt; On Thursday, September 21, 2023 4:02:49 PM EDT Amjad Gabbar wrote:<br>
&gt; &gt; &gt; The best solution would be a kernel modification so that the=
re are no<br>
&gt; &gt; &gt; mismatched lists.<br>
&gt; &gt; <br>
&gt; &gt; I agree as well....This would be the cleanest solution. This woul=
d also<br>
&gt; &gt; solve the userspace problem of maintaining different lists which =
can get<br>
&gt; &gt; out of hand fairly quickly.<br>
&gt; <br>
&gt; After looking into this, a kernel patch would also not work well. It h=
as to<br>
&gt; be arch specific<br>
&gt; <br>
&gt; &gt; &gt; I guess we can warn on that to rewrite in syscall notation.<=
br>
&gt; &gt; <br>
&gt; &gt; We certainly should. I think the user should know that there is a=
<br>
&gt; &gt; performance cost associated with watches and we should explicitly=
 mention<br>
&gt; &gt; how it can be optimized in the manpages also. The reason being I =
am<br>
&gt; &gt; pretty sure, numerous users/repos still do make use of the -w not=
ation<br>
&gt; &gt; and we do want to let them know the issue here. We also need to m=
ake<br>
&gt; &gt; quite a few changes to the manpages also regarding this. Because,=
<br>
&gt; &gt; initially even I was=C2=A0 very confused when reading the man pag=
es and seeing<br>
&gt; &gt; the actual implementation of and results were not quite in sync.<=
br>
&gt; <br>
&gt; I have made the changes to the master and audit-3.1-maint branches. Pl=
ease<br>
&gt; everyone concerned give them tests. The short of it is that if you use=
 the<br>
&gt; &#39;- w&#39; notation for watches, it will remain the same and slower=
.<br>
<br>
Actually, ths is the one that draws the warning to urge people to migrate.<=
br>
<br>
&gt; If you use<br>
&gt; the syscall notation without &quot;-F arch&quot;, you will get a warni=
ng that it<br>
&gt; cannot be optimized without adding &quot;-Farch&quot;.<br>
<br>
Actually, you won&#39;t in order to preserve intentional behavior.<br>
<br>
&gt; If you add &quot;-F arch&quot;, you<br>
&gt; will possibly need one for both arches which means doubling the rules.=
 If<br>
&gt; you do not want to double the rules, you might place a syscall rule fo=
r<br>
&gt; any 32 system call (21-no32bit.rules). Or you can leave it as is and n=
ot<br>
&gt; care. The sample rules and all man pages have been updated.<br>
<br>
I should have provided an example of what this means. If you have this kind=
<br>
of rule:<br>
<br>
-w /etc/shadow -p wa -k shadow<br>
<br>
And when applied draws a warning:<br>
<br>
# auditctl -w /etc/shadow -p wa -k shadow<br>
Old style watch rules are slower<br>
<br>
It should be rewritten as<br>
<br>
-a always,exit -F arch=3Db64 -F path=3D/etc/shadow -F perm=3Dwa -F key=3Dsh=
adow<br>
<br>
Then it looks like this when loaded:<br>
<br>
#auditctl -l<br>
-a always,exit -F arch=3Db64 -S open,bind,truncate,ftruncate,rename,mkdir,r=
mdir,creat,link,unlink,symlink,chmod,fchmod,chown,fchown,lchown,mknod,acct,=
swapon,quotactl,setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremo=
vexattr,openat,mkdirat,mknodat,fchownat,unlinkat,renameat,linkat,symlinkat,=
fchmodat,fallocate,renameat2,openat2 -F path=3D/etc/shadow -F perm=3Dwa -F =
key=3Dshadow<br>
<br>
And to delete=C2=A0 the rule, <br>
auditctl -d always,exit -F arch=3Db64 -F path=3D/etc/shadow -F perm=3Dwa -F=
 key=3Dshadow<br>
<br>
or the long way<br>
<br>
auditctl -d always,exit -F arch=3Db64 -S open,bind,truncate,ftruncate,renam=
e,mkdir,rmdir,creat,link,unlink,symlink,chmod,fchmod,chown,fchown,lchown,mk=
nod,acct,swapon,quotactl,setxattr,lsetxattr,fsetxattr,removexattr,lremovexa=
ttr,fremovexattr,openat,mkdirat,mknodat,fchownat,unlinkat,renameat,linkat,s=
ymlinkat,fchmodat,fallocate,renameat2,openat2 -F path=3D/etc/shadow -F perm=
=3Dwa -F key=3Dshadow<br>
<br>
Hopefully this is clearer what the change is.<br>
<br>
-Steve<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000760def0606821366--

--===============7640820996097210896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============7640820996097210896==--

