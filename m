Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBD07A8339
	for <lists+linux-audit@lfdr.de>; Wed, 20 Sep 2023 15:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695216226;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1hsXd29ZyyJmRcWXw8qvt/WnfLjWsZpY2febDuaUVKk=;
	b=IVjIiDQKTJ5EF+INIADHSgoXk0Tjnybzn8d+jTKEJYA2FMj3a+MseJDkTmyIvby/xfZBlx
	yH0JLQpaFAtCSh880wETh6I7Kd1HsVKnNflzSf0GW8rgCpxtAC+E2jbOTSjRrtIg3goM4o
	WhrB7tL/njV2a4czYMyIA1C/W8NUsm4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-TxiHF7vkOsOoBXfCus7qbg-1; Wed, 20 Sep 2023 09:23:42 -0400
X-MC-Unique: TxiHF7vkOsOoBXfCus7qbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E988800888;
	Wed, 20 Sep 2023 13:23:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB5B5C185EE;
	Wed, 20 Sep 2023 13:23:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3DF3E19465BC;
	Wed, 20 Sep 2023 13:23:14 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25542194658D for <linux-audit@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 00:26:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB4182156702; Wed, 20 Sep 2023 00:26:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2EF12156701
 for <linux-audit@redhat.com>; Wed, 20 Sep 2023 00:26:18 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB5CE800888
 for <linux-audit@redhat.com>; Wed, 20 Sep 2023 00:26:18 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-6wM1yD3uPLSLJ6DH4BM1vg-1; Tue, 19 Sep 2023 20:26:16 -0400
X-MC-Unique: 6wM1yD3uPLSLJ6DH4BM1vg-1
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4142ca41b89so41438171cf.0; 
 Tue, 19 Sep 2023 17:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695169575; x=1695774375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjnovkkXZOt8i9QTTt+Rj4LYQmkrDfe9gI5lDrkb1DM=;
 b=dpZdwYtV6lLioSDKB6gfMtahkC8om1pzKGkHkfr4P73BuPP36ur4TCkJMVOFRHF7rL
 aZIiAScY4wGu866GWRPhG7CMVbYw72DYem24C+5SheWJJbmrPM7YeVVtFMDsRDPgEefh
 HWcK1lxHsFM6/2oHktgd2a+zQ97dNGBZhIvDPgKedU1Il6wPrvVZ1nvkCaMduEStM1Yp
 FQgWjDiV98jd5L/5vCMZ74xYcxTt29E0v2t41vOnNjosW9VS/YXxepBMuKxiYf7P9fRk
 Np66cfYI8SRzUafPt9XHeQN6x+l5RTV1PejSBHWW9KZEigE7ewXsCLdZ9SINRMvMJ5cG
 LFVA==
X-Gm-Message-State: AOJu0YzQfnnvNc9PyjFowe4+nE5nSFCsQRBN74AcjBPPlto5Gchs4Bzz
 21mv/lB0mZK4WUUdCI13pEZXHDhExP7oiQVmLHrEGSgT
X-Google-Smtp-Source: AGHT+IEwQSQhR/cwizpwC5qY/9Ms3qXp3h/GnmiXTHozbyLC7PuBQ7DqQH6MFRrgFBpk4OfnRonjgYBwCvxjt0DYiKM=
X-Received: by 2002:a05:622a:10c:b0:411:fcd7:ac61 with SMTP id
 u12-20020a05622a010c00b00411fcd7ac61mr1319134qtw.12.1695169575198; Tue, 19
 Sep 2023 17:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <ZPjZ6py5vxdvKTY0@madcap2.tricolour.ca>
 <CAJcJf=TQ6R4zjNPX+TQyDBxtFz+QWQWDqT3t0PEXvzp9CvJS_g@mail.gmail.com>
 <8295448.T7Z3S40VBb@x2>
In-Reply-To: <8295448.T7Z3S40VBb@x2>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Tue, 19 Sep 2023 19:26:04 -0500
Message-ID: <CAJcJf=SJxd3bnu2Pi4Ps5fL8NUowQrvuVn+VgrBK5bY0pUdbAg@mail.gmail.com>
Subject: Re: Sycall Rules vs Watch Rules
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Wed, 20 Sep 2023 13:20:24 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============0219415409905688062=="

--===============0219415409905688062==
Content-Type: multipart/alternative; boundary="0000000000005d23af0605bf6c0f"

--0000000000005d23af0605bf6c0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> The perm fields select the right system calls
> that should be reported on.

That is accurate from a functional perspective. There is no change in the
events logged. But there is a difference in performance. This is most
evident for syscalls not part of the perm fields.

Futex is a syscall that I see called fairly often in my system, which is
not part of the perm fields.
As an example, I selected the ospp rules file to measure  performance via a
synthetic test-
https://github.com/linux-audit/audit-userspace/blob/master/rules/30-ospp-v4=
2.rules

stress-ng =E2=80=94futex 1 =E2=80=94futex-ops 1000000

If we look at the performance numbers for the file rules as is, the
auditing percentage is about 14%.

Now if we were to just add the specific syscalls that the perm fields
filter on in the rules file, the auditing percentage would drop to around
2%.

Again this synthetic test is just for demonstration purposes but helps
explain the point. Basically for syscalls not part of the perm fields we
filter them at a much later stage in the AUDIT_PERM case(due to -S all)
whereas if we use specific syscalls within the rule itself, we would exit
the processing in audit_filter_syscall itself for uninteresting syscalls,
hence improving the performance.

>I see a 1 line change that I am testing.
Let me know if you need any help. I did have a partial PR ready for
submission but wanted to get your opinions before submitting anything.

Regards
Ali Adnan

On Tue, Sep 19, 2023 at 6:33 PM Steve Grubb <sgrubb@redhat.com> wrote:

> Hello,
>
> On Tuesday, September 12, 2023 5:20:54 PM EDT Amjad Gabbar wrote:
> > Based on this and some experiments I have been performing, I would
> suggest
> > changing how a lot of the FileSystem rules are written and illustrated.
> > Ex -
> >
> https://github.com/linux-audit/audit-userspace/blob/master/rules/30-pci-d=
ss
> > -v31.rules#L34-L35
> >
> > The rule in the repository is
> > -a always,exit -F path=3D/etc/sudoers -F perm=3Dwa -F
> > key=3D10.2.2-priv-config-changes
> >
> > My suggestion is to instead change the rule based on the permissions
> > defined. The above rule would change to the following based on the kern=
el
> > being used.
> > -a always,exit -S <list of syscalls in audit_write.h and audit_read.h
> > +open,openat> -F path=3D/etc/sudoers -F perm=3Dwa -F
> > key=3D10.2.2-priv-config-changes
>
> That should be exactly what the kernel does with the perm fields. The per=
m
> fields select the right system calls that should be reported on.
>
> > This is higher performance because we are limiting the syscalls instead
> of
> > making use of -S all which has more paths of evaluation for each and
> every
> > syscall.
> >
> > Same thing for watches. Watches are inherently -S all rules which are
> very
> > performance intensive.
> >
> https://github.com/linux-audit/audit-userspace/blob/1482cec74f2d9472f81dd=
4f
> > 0533484bd0c26decd/lib/libaudit.c#L805
>
> There should be no difference in performance between watches and syscall
> based file auditing.
>
> > Ideally we should limit the syscalls based on the permissions being use=
d.
> >
> > I have implemented the same in my environment rules and have noticed a
> > massive performance difference with no difference in the events being
> > logged since we anyways filter eventually based on the permissions.
> >
> > Let me know what you all think.
>
> I'm looking into this more. I see a 1 line change that I am testing.
>
> -Steve
>
> > On Wed, Sep 6, 2023 at 2:58 PM Richard Guy Briggs <rgb@redhat.com>
> wrote:
> > > On 2023-09-06 10:56, Amjad Gabbar wrote:
> > > > Hi,
> > > >
> > > > I have done some analysis and digging into how both the watch rules
> and
> > > > syscall rules are translated.
> > > >
> > > > From my understanding, in terms of logging, both the below rules ar=
e
> > > > similar. There is no difference in either of the rules.
> > > >
> > > > 1. -w /etc -p wa -k ETC_WATCH
> > >
> > > They are similar in this case.
> > > -w behaves differently depending on the existance of the watched enti=
ty
> > > and the presence of a trailing "/".  This is why the form above is
> > > deprecated.
> > >
> > > > 2. -a always,exit -F arch=3Db64 -S <all syscalls part of the write =
and
> > > > attr
> > > > classes> -F dir=3D/etc  -F perm=3Dwa -k ETC_WATCH
> > > >
> > > > The write and attr classes consist of syscalls in
> > > > =E2=80=9Cinclude/asm-generic/audit_*.h=E2=80=9C.
> > > >
> > > >  The perm flag is needed in the second case for including open/open=
at
> > > >
> > > > syscalls which are not a part of the write and attr syscall list.
> > > >
> > > > I'd like to verify if what I mentioned earlier is accurate, and I
> have
> > > > an
> > > > additional point but depends on whether this is accurate.
> > > >
> > > > Ali
> > >
> > > - RGB
> > >
> > > --
> > > Richard Guy Briggs <rgb@redhat.com>
> > > Sr. S/W Engineer, Kernel Security, Base Operating Systems
> > > Remote, Ottawa, Red Hat Canada
> > > Upstream IRC: SunRaycer
> > > Voice: +1.613.860 2354 SMS: +1.613.518.6570
>
>
>
>
>

--0000000000005d23af0605bf6c0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><div dir=3D"auto">&g=
t; The perm fields select the right system calls=C2=A0</div><div dir=3D"aut=
o">&gt; that should be reported on.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">That is accurate from a functional perspective. There is no cha=
nge in the events logged. But there is a difference in performance. This is=
 most evident for syscalls not part of the perm fields.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Futex is a syscall that I see called fairly=
 often in my system, which is not part of the perm fields.</div><div dir=3D=
"auto">As an example, I selected the ospp rules file to measure =C2=A0perfo=
rmance via a synthetic test-=C2=A0<div><a href=3D"https://github.com/linux-=
audit/audit-userspace/blob/master/rules/30-ospp-v42.rules">https://github.c=
om/linux-audit/audit-userspace/blob/master/rules/30-ospp-v42.rules</a></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">stress-ng =E2=80=94futex 1 =
=E2=80=94futex-ops 1000000=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">If we look at the performance numbers for the file rules as is, t=
he auditing percentage is about 14%.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Now if we were to just add the specific syscalls that the perm=
 fields filter on in the rules file, the auditing percentage would drop to =
around 2%.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Again this sy=
nthetic test is just for demonstration purposes but helps explain the point=
. Basically for syscalls not part of the perm fields we filter them at a mu=
ch later stage in the AUDIT_PERM case(due to -S all) whereas if we use spec=
ific syscalls within the rule itself, we would exit the processing in audit=
_filter_syscall itself for uninteresting syscalls, hence improving the perf=
ormance.</div><div dir=3D"auto"><br></div><div dir=3D"auto">&gt;I=C2=A0<spa=
n style=3D"background-color:rgba(0,0,0,0);border-color:rgb(0,0,0) rgb(0,0,0=
) rgb(0,0,0) rgb(204,204,204);color:rgb(0,0,0)">see a 1 line change that I =
am testing.</span></div><div dir=3D"auto"><span style=3D"background-color:r=
gba(0,0,0,0);border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204)=
;color:rgb(0,0,0)">Let me know if you need any help. I did have a partial P=
R ready for submission but wanted to get your opinions before submitting an=
ything.</span></div><div dir=3D"auto"><span style=3D"background-color:rgba(=
0,0,0,0);border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,204,204);col=
or:rgb(0,0,0)"><br></span></div><div dir=3D"auto"><span style=3D"background=
-color:rgba(0,0,0,0);border-color:rgb(0,0,0) rgb(0,0,0) rgb(0,0,0) rgb(204,=
204,204);color:rgb(0,0,0)">Regards</span></div><div dir=3D"auto"><span styl=
e=3D"background-color:rgba(0,0,0,0);border-color:rgb(0,0,0) rgb(0,0,0) rgb(=
0,0,0) rgb(204,204,204);color:rgb(0,0,0)">Ali Adnan</span></div><div dir=3D=
"auto"><br></div></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Sep 19, 2023 at 6:33 PM Steve Grubb &lt;<a href=
=3D"mailto:sgrubb@redhat.com">sgrubb@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">Hello,<br>
<br>
On Tuesday, September 12, 2023 5:20:54 PM EDT Amjad Gabbar wrote:<br>
&gt; Based on this and some experiments I have been performing, I would sug=
gest<br>
&gt; changing how a lot of the FileSystem rules are written and illustrated=
.<br>
&gt; Ex -<br>
&gt; <a href=3D"https://github.com/linux-audit/audit-userspace/blob/master/=
rules/30-pci-dss" rel=3D"noreferrer" target=3D"_blank">https://github.com/l=
inux-audit/audit-userspace/blob/master/rules/30-pci-dss</a><br>
&gt; -v31.rules#L34-L35<br>
&gt; <br>
&gt; The rule in the repository is<br>
&gt; -a always,exit -F path=3D/etc/sudoers -F perm=3Dwa -F<br>
&gt; key=3D10.2.2-priv-config-changes<br>
&gt; <br>
&gt; My suggestion is to instead change the rule based on the permissions<b=
r>
&gt; defined. The above rule would change to the following based on the ker=
nel<br>
&gt; being used.<br>
&gt; -a always,exit -S &lt;list of syscalls in audit_write.h and audit_read=
.h<br>
&gt; +open,openat&gt; -F path=3D/etc/sudoers -F perm=3Dwa -F<br>
&gt; key=3D10.2.2-priv-config-changes<br>
<br>
That should be exactly what the kernel does with the perm fields. The perm =
<br>
fields select the right system calls that should be reported on.<br>
<br>
&gt; This is higher performance because we are limiting the syscalls instea=
d of<br>
&gt; making use of -S all which has more paths of evaluation for each and e=
very<br>
&gt; syscall.<br>
&gt; <br>
&gt; Same thing for watches. Watches are inherently -S all rules which are =
very<br>
&gt; performance intensive.<br>
&gt; <a href=3D"https://github.com/linux-audit/audit-userspace/blob/1482cec=
74f2d9472f81dd4f" rel=3D"noreferrer" target=3D"_blank">https://github.com/l=
inux-audit/audit-userspace/blob/1482cec74f2d9472f81dd4f</a><br>
&gt; 0533484bd0c26decd/lib/libaudit.c#L805<br>
<br>
There should be no difference in performance between watches and syscall <b=
r>
based file auditing.<br>
<br>
&gt; Ideally we should limit the syscalls based on the permissions being us=
ed.<br>
&gt; <br>
&gt; I have implemented the same in my environment rules and have noticed a=
<br>
&gt; massive performance difference with no difference in the events being<=
br>
&gt; logged since we anyways filter eventually based on the permissions.<br=
>
&gt; <br>
&gt; Let me know what you all think.<br>
<br>
I&#39;m looking into this more. I see a 1 line change that I am testing.<br=
>
<br>
-Steve<br>
<br>
&gt; On Wed, Sep 6, 2023 at 2:58 PM Richard Guy Briggs &lt;<a href=3D"mailt=
o:rgb@redhat.com" target=3D"_blank">rgb@redhat.com</a>&gt; wrote:<br>
&gt; &gt; On 2023-09-06 10:56, Amjad Gabbar wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I have done some analysis and digging into how both the watc=
h rules and<br>
&gt; &gt; &gt; syscall rules are translated.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; From my understanding, in terms of logging, both the below r=
ules are<br>
&gt; &gt; &gt; similar. There is no difference in either of the rules.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; 1. -w /etc -p wa -k ETC_WATCH<br>
&gt; &gt; <br>
&gt; &gt; They are similar in this case.<br>
&gt; &gt; -w behaves differently depending on the existance of the watched =
entity<br>
&gt; &gt; and the presence of a trailing &quot;/&quot;.=C2=A0 This is why t=
he form above is<br>
&gt; &gt; deprecated.<br>
&gt; &gt; <br>
&gt; &gt; &gt; 2. -a always,exit -F arch=3Db64 -S &lt;all syscalls part of =
the write and<br>
&gt; &gt; &gt; attr<br>
&gt; &gt; &gt; classes&gt; -F dir=3D/etc=C2=A0 -F perm=3Dwa -k ETC_WATCH<br=
>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The write and attr classes consist of syscalls in<br>
&gt; &gt; &gt; =E2=80=9Cinclude/asm-generic/audit_*.h=E2=80=9C.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 The perm flag is needed in the second case for includi=
ng open/openat<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; syscalls which are not a part of the write and attr syscall =
list.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;d like to verify if what I mentioned earlier is accura=
te, and I have<br>
&gt; &gt; &gt; an<br>
&gt; &gt; &gt; additional point but depends on whether this is accurate.<br=
>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Ali<br>
&gt; &gt; <br>
&gt; &gt; - RGB<br>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; Richard Guy Briggs &lt;<a href=3D"mailto:rgb@redhat.com" target=
=3D"_blank">rgb@redhat.com</a>&gt;<br>
&gt; &gt; Sr. S/W Engineer, Kernel Security, Base Operating Systems<br>
&gt; &gt; Remote, Ottawa, Red Hat Canada<br>
&gt; &gt; Upstream IRC: SunRaycer<br>
&gt; &gt; Voice: +1.613.860 2354 SMS: +1.613.518.6570<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000005d23af0605bf6c0f--

--===============0219415409905688062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0219415409905688062==--

