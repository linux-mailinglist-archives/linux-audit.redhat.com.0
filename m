Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9A7A5898
	for <lists+linux-audit@lfdr.de>; Tue, 19 Sep 2023 06:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695099075;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6Ts4deztgaY7tuPMO4PN/0QFToOqRtO7WCEzMRe7WyM=;
	b=GuHgBpHkbmu3UVDWn4jmQjhoQjKNn6ReTiRhA7j6jttBExk4Qnr7iBKSwroYCS+TacGHMK
	OFlDS34Eckgk5r3zOiXd6x7ZbBs8fi5zPkUc87sInwnhpsVgyZWQk9y9JaWbotsHRq3eKd
	7E4/xs/Xazji4Awt/bOxZQAg1lOqwvQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-NN27SeMVMsOzF4imRqWxng-1; Tue, 19 Sep 2023 00:51:11 -0400
X-MC-Unique: NN27SeMVMsOzF4imRqWxng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 913C03C0F661;
	Tue, 19 Sep 2023 04:51:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F281F1054FC0;
	Tue, 19 Sep 2023 04:51:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2601B19465BC;
	Tue, 19 Sep 2023 04:50:59 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D65651946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 15 Sep 2023 06:00:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B01D51054FC2; Fri, 15 Sep 2023 06:00:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A79631054FC0
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 06:00:55 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83664857A9A
 for <linux-audit@redhat.com>; Fri, 15 Sep 2023 06:00:55 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-UORSYW4gOneDwrKy0lRffg-1; Fri, 15 Sep 2023 02:00:51 -0400
X-MC-Unique: UORSYW4gOneDwrKy0lRffg-1
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4122436627eso10399021cf.3; 
 Thu, 14 Sep 2023 23:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694757650; x=1695362450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k6PeEBR0BaXyiUFCQrSJEFN4kY0kpYQ4OjLEhLzvuik=;
 b=mv7M0IME+/KS+3tseon6DRnL5zpWoiCnCl8xRnGFMhod8soZLxC/mOr30IsnoKgJvi
 ucnZxnPTQbuD/j+oz/7FHiN8UeI0kilezbQs4wIA97f0hsNCet9B1ncWOvT97ZuE17p2
 7G0bJ8Igmxxq64xt6xI3sIawOs3XsD5NM0TB3Z60Jb4jpZCrMqInGv8ElAVlPurT5DSu
 hLLBNlrsRitn2H1xbp7BG0pRFMbR+4fgTWySnuIcECqFvPg/y+E2dWsFg7NGDbkssdr7
 x8ZGZa1HnfWPDKL3jquTY9I488MCB8AsFRMeZ6v7WedLFrlaJZuUfcJgWFXpiqoqwATt
 PLxQ==
X-Gm-Message-State: AOJu0YzMDhkk05or/m2vGQcFICnFcsCep7w4JmylZMs2hJZE9U3yRC8g
 W7zHEsucFOpD57kTXZsubg8lZyoTmIHJQc3hUH6FH7YQ
X-Google-Smtp-Source: AGHT+IFWKuclE1rbOj59mI9ktekXjljs2LMUHgXlTPmWehnU/dv5pfNO6sSlSApHn3t/ocsE/1Q4uaPLyRdnrI6v+eI=
X-Received: by 2002:a05:622a:1aa4:b0:410:acd3:38f1 with SMTP id
 s36-20020a05622a1aa400b00410acd338f1mr1000273qtc.2.1694757650430; Thu, 14 Sep
 2023 23:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <ZPjZ6py5vxdvKTY0@madcap2.tricolour.ca>
 <CAJcJf=TQ6R4zjNPX+TQyDBxtFz+QWQWDqT3t0PEXvzp9CvJS_g@mail.gmail.com>
In-Reply-To: <CAJcJf=TQ6R4zjNPX+TQyDBxtFz+QWQWDqT3t0PEXvzp9CvJS_g@mail.gmail.com>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Fri, 15 Sep 2023 01:00:39 -0500
Message-ID: <CAJcJf=RTgSXNnmxgkP1r5iVHPzvVu2Ocyyj_8qJ5_V5p0NddkQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============4412796946518693254=="

--===============4412796946518693254==
Content-Type: multipart/alternative; boundary="000000000000bbfee006055f8333"

--000000000000bbfee006055f8333
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just wanted to follow up wrt the previous findings and experiments and what
some of your thoughts are on the suggested optimizations.

Regards
Ali

On Tue, Sep 12, 2023 at 4:20 PM Amjad Gabbar <amjadgabbar11@gmail.com>
wrote:

> So,
>
> Based on this and some experiments I have been performing, I would sugges=
t
> changing how a lot of the FileSystem rules are written and illustrated.
> Ex -
> https://github.com/linux-audit/audit-userspace/blob/master/rules/30-pci-d=
ss-v31.rules#L34-L35
>
> The rule in the repository is
> -a always,exit -F path=3D/etc/sudoers -F perm=3Dwa -F
> key=3D10.2.2-priv-config-changes
>
> My suggestion is to instead change the rule based on the permissions
> defined. The above rule would change to the following based on the kernel
> being used.
> -a always,exit -S <list of syscalls in audit_write.h and audit_read.h
> +open,openat> -F path=3D/etc/sudoers -F perm=3Dwa -F
> key=3D10.2.2-priv-config-changes
>
> This is higher performance because we are limiting the syscalls instead o=
f
> making use of -S all which has more paths of evaluation for each and ever=
y
> syscall.
>
> Same thing for watches. Watches are inherently -S all rules which are ver=
y
> performance intensive.
>
> https://github.com/linux-audit/audit-userspace/blob/1482cec74f2d9472f81dd=
4f0533484bd0c26decd/lib/libaudit.c#L805
>
> Ideally we should limit the syscalls based on the permissions being used.
>
> I have implemented the same in my environment rules and have noticed a
> massive performance difference with no difference in the events being
> logged since we anyways filter eventually based on the permissions.
>
> Let me know what you all think.
>
> Ali Adnan.
>
>
>
>
>
> On Wed, Sep 6, 2023 at 2:58 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
>> On 2023-09-06 10:56, Amjad Gabbar wrote:
>> > Hi,
>> >
>> > I have done some analysis and digging into how both the watch rules an=
d
>> > syscall rules are translated.
>> >
>> > From my understanding, in terms of logging, both the below rules are
>> > similar. There is no difference in either of the rules.
>> >
>> > 1. -w /etc -p wa -k ETC_WATCH
>>
>> They are similar in this case.
>> -w behaves differently depending on the existance of the watched entity
>> and the presence of a trailing "/".  This is why the form above is
>> deprecated.
>>
>> > 2. -a always,exit -F arch=3Db64 -S <all syscalls part of the write and
>> attr
>> > classes> -F dir=3D/etc  -F perm=3Dwa -k ETC_WATCH
>> >
>> > The write and attr classes consist of syscalls in
>> > =E2=80=9Cinclude/asm-generic/audit_*.h=E2=80=9C.
>> >
>> >  The perm flag is needed in the second case for including open/openat
>> > syscalls which are not a part of the write and attr syscall list.
>> >
>> > I'd like to verify if what I mentioned earlier is accurate, and I have
>> an
>> > additional point but depends on whether this is accurate.
>> >
>> > Ali
>>
>> - RGB
>>
>> --
>> Richard Guy Briggs <rgb@redhat.com>
>> Sr. S/W Engineer, Kernel Security, Base Operating Systems
>> Remote, Ottawa, Red Hat Canada
>> Upstream IRC: SunRaycer
>> Voice: +1.613.860 2354 SMS: +1.613.518.6570
>>
>>

--000000000000bbfee006055f8333
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ju=
st wanted to follow up wrt the previous findings and experiments and what s=
ome of your thoughts are on the suggested optimizations.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Ali</div><d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Sep 12, 2023 at 4:20 PM Amjad Gabbar &lt;<a href=3D"mailto:amjadgabbar=
11@gmail.com">amjadgabbar11@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><div dir=3D"auto">So,</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Based on this and some experiments I have =
been performing, I would suggest changing how a lot of the FileSystem rules=
 are written and illustrated.</div><div>Ex -=C2=A0<a href=3D"https://github=
.com/linux-audit/audit-userspace/blob/master/rules/30-pci-dss-v31.rules#L34=
-L35" target=3D"_blank">https://github.com/linux-audit/audit-userspace/blob=
/master/rules/30-pci-dss-v31.rules#L34-L35</a></div><div><br></div><div>The=
 rule in the repository is</div><div>-a always,exit -F path=3D/etc/sudoers =
-F perm=3Dwa -F key=3D10.2.2-priv-config-changes<br></div><div><br></div><d=
iv>My suggestion is to instead change the rule based on the permissions def=
ined. The above rule would change to the following=C2=A0based on the kernel=
 being used.</div><div>-a always,exit -S &lt;list of syscalls in audit_writ=
e.h and audit_read.h +open,openat&gt; -F path=3D/etc/sudoers -F perm=3Dwa -=
F key=3D10.2.2-priv-config-changes<br></div><div><br></div><div>This is hig=
her performance because we are limiting the syscalls instead of making use =
of -S all which has more paths of evaluation for each and every syscall.</d=
iv><div><br></div><div>Same thing for watches. Watches are inherently -S al=
l rules which are very performance=C2=A0intensive.</div><div><a href=3D"htt=
ps://github.com/linux-audit/audit-userspace/blob/1482cec74f2d9472f81dd4f053=
3484bd0c26decd/lib/libaudit.c#L805" target=3D"_blank">https://github.com/li=
nux-audit/audit-userspace/blob/1482cec74f2d9472f81dd4f0533484bd0c26decd/lib=
/libaudit.c#L805</a><br></div><div><br></div><div>Ideally we should limit t=
he syscalls based on the permissions being used.=C2=A0</div><div><br></div>=
<div>I have implemented the same in my environment rules and have noticed a=
 massive performance difference with no difference in the events being logg=
ed since we anyways filter eventually based on the permissions.</div><div><=
br></div><div>Let me know what you all think.</div><div><br></div><div>Ali =
Adnan.</div><div><br></div><div><br></div><div><br></div><div><br></div></d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Sep 6, 2023 at 2:58 PM Richard Guy Briggs &lt;<a href=3D"mailto:r=
gb@redhat.com" target=3D"_blank">rgb@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 2023-09-06 10:56, Amjad G=
abbar wrote:<br>
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
</blockquote></div></div>

--000000000000bbfee006055f8333--

--===============4412796946518693254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4412796946518693254==--

