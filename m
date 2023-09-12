Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BAF7A5897
	for <lists+linux-audit@lfdr.de>; Tue, 19 Sep 2023 06:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695099074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pyKrTVDMpKWrdcWH6/mutAH9kGpkglfPP83QAACTjZM=;
	b=YIVqqO2DISax0XJTBgQplOn+lfPOvAm/HLTnlwXreRoeJtwXW3/tTh7jvSL+sAqJVCUKpK
	N+pJ4Vpw6X1j/gLVzzgBJv4hzbinUlVebeL+e0z+4rIJ6ZOq5iMqZV0QqJryphMW2jmhWd
	5P0t1ZbmNu4nRJXbZ+lfqJdHZTQTHRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-0Bv4P49gMW2w5iPdc0N9yw-1; Tue, 19 Sep 2023 00:51:11 -0400
X-MC-Unique: 0Bv4P49gMW2w5iPdc0N9yw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 902DA85A5A8;
	Tue, 19 Sep 2023 04:51:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6F1B492B05;
	Tue, 19 Sep 2023 04:51:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 058D419465B2;
	Tue, 19 Sep 2023 04:50:59 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5846F194658D for <linux-audit@listman.corp.redhat.com>;
 Tue, 12 Sep 2023 21:21:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 331C110F1BE8; Tue, 12 Sep 2023 21:21:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA19A10F1BE7
 for <linux-audit@redhat.com>; Tue, 12 Sep 2023 21:21:13 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C361A8E5066
 for <linux-audit@redhat.com>; Tue, 12 Sep 2023 21:21:13 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-ZGkv8Sd_NrqiPoG-4OnFbw-1; Tue, 12 Sep 2023 17:21:09 -0400
X-MC-Unique: ZGkv8Sd_NrqiPoG-4OnFbw-1
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2bce552508fso100842971fa.1; 
 Tue, 12 Sep 2023 14:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694553667; x=1695158467;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qV1V4Eha2xyp0bxYlb7lVaj5OBEe+gopnVYTa4Qkix4=;
 b=DNKyQI0Cg6PWnVHZc5xa/Xz3rYd8YXafXbCb8rcOPDKkQQ823mRmUdl+oFnSdiyqV5
 qYnuJ7k1z7pXrz8rIOFUtzY9tSfemlwCVn4XrFGuSDIzQqhe0D/uUAV4EFFSUcw9YAvz
 k2qDyE89v5WJ0rZnMKv+JSzArTi0PyeDndkgoweeaSSKdl9RmDDv61mdE4SIXFxAmEgX
 tJDYxIhqppGKdFeQXCYN9+OSsL7m0qe9tA3+eOIn+sfkOQEt+HND6p4QnMnQ99DqdXbf
 xfbL6whLqMxy1oPXHNDxdqAABCbIb7pHqQqp6HzJ1F5fs03oVPO27Kz7H6HCWPN3Lhxu
 Y9HQ==
X-Gm-Message-State: AOJu0YzVa+ANXVWWBqN6Oof9cuSukz8usvQgm2Im3ZAH3FQcNZ9JxnUG
 Ku2jdqOG95USrO310qWlzEZNJZvt6XgAMuqzItMrLzT1AIA=
X-Google-Smtp-Source: AGHT+IGb/rPoySjpOLx9GDlCAkYTNQJEDYyXzXR6U+maBPSY9YzoQRT9v/2iuFtsZ3F5UDUU6C9aRvYkOQJzmgK2Lho=
X-Received: by 2002:a2e:9b12:0:b0:2bd:c23:c810 with SMTP id
 u18-20020a2e9b12000000b002bd0c23c810mr703213lji.51.1694553666957; Tue, 12 Sep
 2023 14:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <ZPjZ6py5vxdvKTY0@madcap2.tricolour.ca>
In-Reply-To: <ZPjZ6py5vxdvKTY0@madcap2.tricolour.ca>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Tue, 12 Sep 2023 16:20:54 -0500
Message-ID: <CAJcJf=TQ6R4zjNPX+TQyDBxtFz+QWQWDqT3t0PEXvzp9CvJS_g@mail.gmail.com>
Subject: Re: Sycall Rules vs Watch Rules
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Tue, 19 Sep 2023 04:50:57 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============3681365837960769183=="

--===============3681365837960769183==
Content-Type: multipart/alternative; boundary="0000000000005f354e06053005a0"

--0000000000005f354e06053005a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So,

Based on this and some experiments I have been performing, I would suggest
changing how a lot of the FileSystem rules are written and illustrated.
Ex -
https://github.com/linux-audit/audit-userspace/blob/master/rules/30-pci-dss=
-v31.rules#L34-L35

The rule in the repository is
-a always,exit -F path=3D/etc/sudoers -F perm=3Dwa -F
key=3D10.2.2-priv-config-changes

My suggestion is to instead change the rule based on the permissions
defined. The above rule would change to the following based on the kernel
being used.
-a always,exit -S <list of syscalls in audit_write.h and audit_read.h
+open,openat> -F path=3D/etc/sudoers -F perm=3Dwa -F
key=3D10.2.2-priv-config-changes

This is higher performance because we are limiting the syscalls instead of
making use of -S all which has more paths of evaluation for each and every
syscall.

Same thing for watches. Watches are inherently -S all rules which are very
performance intensive.
https://github.com/linux-audit/audit-userspace/blob/1482cec74f2d9472f81dd4f=
0533484bd0c26decd/lib/libaudit.c#L805

Ideally we should limit the syscalls based on the permissions being used.

I have implemented the same in my environment rules and have noticed a
massive performance difference with no difference in the events being
logged since we anyways filter eventually based on the permissions.

Let me know what you all think.

Ali Adnan.





On Wed, Sep 6, 2023 at 2:58 PM Richard Guy Briggs <rgb@redhat.com> wrote:

> On 2023-09-06 10:56, Amjad Gabbar wrote:
> > Hi,
> >
> > I have done some analysis and digging into how both the watch rules and
> > syscall rules are translated.
> >
> > From my understanding, in terms of logging, both the below rules are
> > similar. There is no difference in either of the rules.
> >
> > 1. -w /etc -p wa -k ETC_WATCH
>
> They are similar in this case.
> -w behaves differently depending on the existance of the watched entity
> and the presence of a trailing "/".  This is why the form above is
> deprecated.
>
> > 2. -a always,exit -F arch=3Db64 -S <all syscalls part of the write and =
attr
> > classes> -F dir=3D/etc  -F perm=3Dwa -k ETC_WATCH
> >
> > The write and attr classes consist of syscalls in
> > =E2=80=9Cinclude/asm-generic/audit_*.h=E2=80=9C.
> >
> >  The perm flag is needed in the second case for including open/openat
> > syscalls which are not a part of the write and attr syscall list.
> >
> > I'd like to verify if what I mentioned earlier is accurate, and I have =
an
> > additional point but depends on whether this is accurate.
> >
> > Ali
>
> - RGB
>
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> Upstream IRC: SunRaycer
> Voice: +1.613.860 2354 SMS: +1.613.518.6570
>
>

--0000000000005f354e06053005a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">So,</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Based on this and some experiments I have been performing, I=
 would suggest changing how a lot of the FileSystem rules are written and i=
llustrated.</div><div>Ex -=C2=A0<a href=3D"https://github.com/linux-audit/a=
udit-userspace/blob/master/rules/30-pci-dss-v31.rules#L34-L35">https://gith=
ub.com/linux-audit/audit-userspace/blob/master/rules/30-pci-dss-v31.rules#L=
34-L35</a></div><div><br></div><div>The rule in the repository is</div><div=
>-a always,exit -F path=3D/etc/sudoers -F perm=3Dwa -F key=3D10.2.2-priv-co=
nfig-changes<br></div><div><br></div><div>My suggestion is to instead chang=
e the rule based on the permissions defined. The above rule would change to=
 the following=C2=A0based on the kernel being used.</div><div>-a always,exi=
t -S &lt;list of syscalls in audit_write.h and audit_read.h +open,openat&gt=
; -F path=3D/etc/sudoers -F perm=3Dwa -F key=3D10.2.2-priv-config-changes<b=
r></div><div><br></div><div>This is higher performance because we are limit=
ing the syscalls instead of making use of -S all which has more paths of ev=
aluation for each and every syscall.</div><div><br></div><div>Same thing fo=
r watches. Watches are inherently -S all rules which are very performance=
=C2=A0intensive.</div><div><a href=3D"https://github.com/linux-audit/audit-=
userspace/blob/1482cec74f2d9472f81dd4f0533484bd0c26decd/lib/libaudit.c#L805=
">https://github.com/linux-audit/audit-userspace/blob/1482cec74f2d9472f81dd=
4f0533484bd0c26decd/lib/libaudit.c#L805</a><br></div><div><br></div><div>Id=
eally we should limit the syscalls based on the permissions being used.=C2=
=A0</div><div><br></div><div>I have implemented the same in my environment =
rules and have noticed a massive performance difference with no difference =
in the events being logged since we anyways filter eventually based on the =
permissions.</div><div><br></div><div>Let me know what you all think.</div>=
<div><br></div><div>Ali Adnan.</div><div><br></div><div><br></div><div><br>=
</div><div><br></div></div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Sep 6, 2023 at 2:58 PM Richard Guy Briggs=
 &lt;<a href=3D"mailto:rgb@redhat.com" target=3D"_blank">rgb@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 2=
023-09-06 10:56, Amjad Gabbar wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I have done some analysis and digging into how both the watch rules an=
d<br>
&gt; syscall rules are translated.<br>
&gt; <br>
&gt; From my understanding, in terms of logging, both the below rules are<b=
r>
&gt; similar. There is no difference in either of the rules.<br>
&gt; <br>
&gt; 1. -w /etc -p wa -k ETC_WATCH<br>
<br>
They are similar in this case.<br>
-w behaves differently depending on the existance of the watched entity<br>
and the presence of a trailing &quot;/&quot;.=C2=A0 This is why the form ab=
ove is<br>
deprecated.<br>
<br>
&gt; 2. -a always,exit -F arch=3Db64 -S &lt;all syscalls part of the write =
and attr<br>
&gt; classes&gt; -F dir=3D/etc=C2=A0 -F perm=3Dwa -k ETC_WATCH<br>
&gt; <br>
&gt; The write and attr classes consist of syscalls in<br>
&gt; =E2=80=9Cinclude/asm-generic/audit_*.h=E2=80=9C.<br>
&gt; <br>
&gt;=C2=A0 The perm flag is needed in the second case for including open/op=
enat<br>
&gt; syscalls which are not a part of the write and attr syscall list.<br>
&gt; <br>
&gt; I&#39;d like to verify if what I mentioned earlier is accurate, and I =
have an<br>
&gt; additional point but depends on whether this is accurate.<br>
&gt; <br>
&gt; Ali<br>
<br>
- RGB<br>
<br>
--<br>
Richard Guy Briggs &lt;<a href=3D"mailto:rgb@redhat.com" target=3D"_blank">=
rgb@redhat.com</a>&gt;<br>
Sr. S/W Engineer, Kernel Security, Base Operating Systems<br>
Remote, Ottawa, Red Hat Canada<br>
Upstream IRC: SunRaycer<br>
Voice: +1.613.860 2354 SMS: +1.613.518.6570<br>
<br>
</blockquote></div></div>

--0000000000005f354e06053005a0--

--===============3681365837960769183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============3681365837960769183==--

