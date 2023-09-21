Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5A7AB270
	for <lists+linux-audit@lfdr.de>; Fri, 22 Sep 2023 14:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695387034;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hbTrchEjfmdxcIdDkGFt9hCF3Gli284rOxBZBaXSf14=;
	b=PNRIqNCaPbN5O0QQNKZkAwEyTDVC2nbjnJYX+AvAfVuGZEQkK+olZSL/DvBwyboAoRGZZh
	zuA7X+5yq7bCL07lE5i6c1CClPRiNj71p7eSKQF55c5y/fyCG2lYkZBWCmWcxpgbTX/1R0
	U7Keby8XFAwcta8/TdXlcPz/7LzEHRs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-AHRnouRAMM6gwAg3Nmb1RQ-1; Fri, 22 Sep 2023 08:50:30 -0400
X-MC-Unique: AHRnouRAMM6gwAg3Nmb1RQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1D131C08977;
	Fri, 22 Sep 2023 12:50:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47A11140273C;
	Fri, 22 Sep 2023 12:50:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B6C7619465B8;
	Fri, 22 Sep 2023 12:50:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66FD11946586 for <linux-audit@listman.corp.redhat.com>;
 Thu, 21 Sep 2023 20:03:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 37B5410F1BE8; Thu, 21 Sep 2023 20:03:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FC3010F1BE7
 for <linux-audit@redhat.com>; Thu, 21 Sep 2023 20:03:05 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BC1D1C00BAA
 for <linux-audit@redhat.com>; Thu, 21 Sep 2023 20:03:05 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-9J8QihaTP0OgMfuXPTLp7g-1; Thu, 21 Sep 2023 16:03:01 -0400
X-MC-Unique: 9J8QihaTP0OgMfuXPTLp7g-1
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4124e1909edso8085531cf.1; 
 Thu, 21 Sep 2023 13:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695326580; x=1695931380;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PCygGPbHRgGm/yQDC2emgT6zSI0bH5OcUMhAtGaJuuE=;
 b=Pv8v6yhblqHesb1muBq9WgM40n8RYvG37Jwn5ibQp5vz+AX7TZvfPLty7+YnbsJw6Q
 4OQemJ2ObVbmiNoQKdvUzygwT0MOXjuo6L3ZsbskwdiyZ0XB9gU3EG3i8K9ppKYn5fwq
 ZfADoH9BiX/pOWhZG9dg7qW2Bo0SEm60yphS4j5oMco2SWJdZACWq664W2aEQ+lZSmDd
 gjHgihw+Fhy6GoRsROkVc8YeWGPkzCwIs9KEOmpYmSa2k9PFsKQOMIe0h3xwrN0mUH/z
 JwgmlhCqK8D6Mwq7EGv9WV3EHNCgOVLNzS+Cj0mpTTLWh83T53xk04kdbsk1N3kGqueq
 YQVA==
X-Gm-Message-State: AOJu0Yz2fgait8yhB9+g2fVANB5uyZTJjdJS88H1PyEdwWryCuo9BVbS
 b/fK7tR4llFRoIt64Po4rk6AB3jBIkTqgA3blWyh+qVjIlM=
X-Google-Smtp-Source: AGHT+IGmmHJNgPalL69BYc9JbPwTWSrvKlMfKdB2NJRDwURqYo+AcfU1nkQ3erR0Mo7joDm82MJhBJ8mdrA96EF/gno=
X-Received: by 2002:a05:622a:54e:b0:403:ed26:4083 with SMTP id
 m14-20020a05622a054e00b00403ed264083mr6918551qtx.61.1695326580166; Thu, 21
 Sep 2023 13:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <CAJcJf=SJxd3bnu2Pi4Ps5fL8NUowQrvuVn+VgrBK5bY0pUdbAg@mail.gmail.com>
 <2334800.ElGaqSPkdT@x2> <8320136.T7Z3S40VBb@x2>
In-Reply-To: <8320136.T7Z3S40VBb@x2>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Thu, 21 Sep 2023 15:02:49 -0500
Message-ID: <CAJcJf=RKAqp0PPQ2EmOZ5jJ6KGZ4rAvmabdDsg+MvkbmcomChA@mail.gmail.com>
Subject: Re: Sycall Rules vs Watch Rules
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Fri, 22 Sep 2023 12:50:19 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============1083857401169230775=="

--===============1083857401169230775==
Content-Type: multipart/alternative; boundary="00000000000096d4900605e3fac1"

--00000000000096d4900605e3fac1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>But I am surprised my concept of how it works doesn't match the
implementation
I wouldn't worry too much about it. The important thing is we caught it and
can move forward and make the necessary corrections.

>The best solution would be a kernel modification so that there are no
mismatched lists.
I agree as well....This would be the cleanest solution. This would also
solve the userspace problem of maintaining different lists which can get
out of hand fairly quickly.

> I guess we can warn on that to rewrite in syscall notation.
We certainly should.
I think the user should know that there is a performance cost associated
with watches and we should explicitly mention how it can be optimized in
the manpages also.
The reason being I am pretty sure, numerous users/repos still do make use
of the -w notation and we do want to let them know the issue here.
We also need to make quite a few changes to the manpages also regarding
this.
Because, initially even I was very confused when reading the man pages and
seeing the actual implementation of and results were not quite in sync.

Regards
Ali Adnan



On Wed, Sep 20, 2023 at 6:33=E2=80=AFPM Steve Grubb <sgrubb@redhat.com> wro=
te:

> On Wednesday, September 20, 2023 2:45:26 PM EDT Steve Grubb wrote:
> > On Tuesday, September 19, 2023 8:26:04 PM EDT Amjad Gabbar wrote:
> > > > The perm fields select the right system calls
> > > > that should be reported on.
> > >
> > > That is accurate from a functional perspective. There is no change in
> the
> > > events logged. But there is a difference in performance. This is most
> > > evident for syscalls not part of the perm fields.
> >
> > <snip>
> >
> > > If we look at the performance numbers for the file rules as is, the
> > > auditing percentage is about 14%.
> > >
> > > Now if we were to just add the specific syscalls that the perm fields
> > > filter on in the rules file, the auditing percentage would drop to
> around
> > > 2%.
> >
> > I think I am mis-remembering something, or there was a change way back =
in
> > the beginning. The plan was that we could optimize access by letting th=
e
> > kernel pick the relevant syscalls based on the permissions. User space
> > would just define the permissions and the kernel would make it so.
> >
> > But there were several redesigns of the file auditing. I looked back as
> far
> > as the 3.1 kernel and it always follows lookup the syscall, if it's
> > relevant, then check the rest of the fields in the rule. This eventuall=
y
> > checks the set of syscalls selected by the perms.
> >
> > The way that it should have worked is when perms is given, throw away a=
ny
> > syscalls and set the mask based on the perms selected. That would have
> been
> > optimal and it was what Al Viro and I talked about long ago. However, i=
t
> > went through several redesigns.
>
> I did some digging. This is the original patch:
> https://listman.redhat.com/archives/linux-audit/2006-August/003593.html
>
> Al does mention that syscalls taking a descriptor should not be included.
> I
> guess that can be cleaned up in the include/asm-generic/audit_*.h files.
>
> I think that patch would have landed in the 2.6.18 kernel. I found a
> 2.6.21
> kernel and the path taken is different:
>
> audit_syscall_exit
> audit_get_context
> audit_filter_inodes   <--- this is where it differs
> audit_filter_rules
> audit_match_perm
>
> In the old kernel, it still called the syscall filter. But I think that
> was
> optimized later. But the whole point of making the perms field was so tha=
t
> user space could just tell the kernel what it needs and the kernel would
> select exactly the syscalls needed. There was no other reason to have it.
>
> Now, what to do about it? A watch was biarch. There were 2 tables for 32 =
&
> 64
> bits and it would swing between them based on the syscall's arch. To fix
> this
> in user space would mean a watch would have to create 2 rules to cover
> biarch. And some systems conceivably may not have 32 bit enabled or vice
> versa. There would be no way for user space to know and work around a
> missing
> arch.
>
> The  -w notation really can't be optimized. It doesn't specify an arch so
> it
> has to be "all". I guess we can warn on that to rewrite in syscall
> notation.
>
> -Steve
>
> > The problem now is that user space has no list of syscalls that match
> each
> > permission. And then, there's no good way to sync based on mixing and
> > matching kernels and user space. The kernel may have an updated syscall
> > list user space doesn't know about and vice versa.
> >
> > I think you are on to something important. But I am surprised my concep=
t
> of
> > how it works doesn't match the implementation. (Al Viro did the origina=
l
> > implementation way back around 2006/7.) The best solution would be a
> > kernel modification so that there are no mismatched lists. A suboptimal
> > solution would be to maintain 2 lists and hope they don't change. Which
> by
> > the way, I think the kernel lists are outdated again. (Syscalls keep
> > getting added - quotactl_fd for example)
> >
> > -Steve
> >
> >
> > --
> > Linux-audit mailing list
> > Linux-audit@redhat.com
> > https://listman.redhat.com/mailman/listinfo/linux-audit
>
>
>
>
>

--00000000000096d4900605e3fac1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;But I am surprised my concept of how it works doesn&#3=
9;t match the implementation<div>I wouldn&#39;t worry too much about it. Th=
e important thing is we caught it and can move forward and make the necessa=
ry corrections.</div><div><br></div><div>&gt;The best solution would be a k=
ernel modification so that there are no mismatched lists.=C2=A0</div><div>I=
 agree as well....This would be the cleanest solution. This would also solv=
e the userspace problem of maintaining different lists which can get out of=
 hand fairly quickly.</div><div><br></div><div>&gt; I guess we can warn on =
that to rewrite in syscall notation.</div><div>We certainly should.=C2=A0</=
div><div>I think the user should know that there is a performance cost asso=
ciated with watches and we should explicitly mention how it can be optimize=
d in the manpages also.</div><div>The reason being I am pretty sure, numero=
us users/repos=C2=A0still do make use of the -w notation and we do want to =
let them know the issue here.</div><div>We also need to make quite a few ch=
anges to the manpages also regarding this.<br>Because, initially even I was=
 very confused when reading the man pages and seeing the actual implementat=
ion of and results were not quite in sync.<br></div><div><br></div><div>Reg=
ards</div><div>Ali Adnan</div><div><br></div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 20,=
 2023 at 6:33=E2=80=AFPM Steve Grubb &lt;<a href=3D"mailto:sgrubb@redhat.co=
m">sgrubb@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wednesday, September 20, 2023 2:45:26 PM EDT Steve G=
rubb wrote:<br>
&gt; On Tuesday, September 19, 2023 8:26:04 PM EDT Amjad Gabbar wrote:<br>
&gt; &gt; &gt; The perm fields select the right system calls<br>
&gt; &gt; &gt; that should be reported on.<br>
&gt; &gt; <br>
&gt; &gt; That is accurate from a functional perspective. There is no chang=
e in the<br>
&gt; &gt; events logged. But there is a difference in performance. This is =
most<br>
&gt; &gt; evident for syscalls not part of the perm fields.<br>
&gt; <br>
&gt; &lt;snip&gt;<br>
&gt; <br>
&gt; &gt; If we look at the performance numbers for the file rules as is, t=
he<br>
&gt; &gt; auditing percentage is about 14%.<br>
&gt; &gt; <br>
&gt; &gt; Now if we were to just add the specific syscalls that the perm fi=
elds<br>
&gt; &gt; filter on in the rules file, the auditing percentage would drop t=
o around<br>
&gt; &gt; 2%.<br>
&gt; <br>
&gt; I think I am mis-remembering something, or there was a change way back=
 in<br>
&gt; the beginning. The plan was that we could optimize access by letting t=
he<br>
&gt; kernel pick the relevant syscalls based on the permissions. User space=
<br>
&gt; would just define the permissions and the kernel would make it so.<br>
&gt; <br>
&gt; But there were several redesigns of the file auditing. I looked back a=
s far<br>
&gt; as the 3.1 kernel and it always follows lookup the syscall, if it&#39;=
s<br>
&gt; relevant, then check the rest of the fields in the rule. This eventual=
ly<br>
&gt; checks the set of syscalls selected by the perms.<br>
&gt; <br>
&gt; The way that it should have worked is when perms is given, throw away =
any<br>
&gt; syscalls and set the mask based on the perms selected. That would have=
 been<br>
&gt; optimal and it was what Al Viro and I talked about long ago. However, =
it<br>
&gt; went through several redesigns.<br>
<br>
I did some digging. This is the original patch:<br>
<a href=3D"https://listman.redhat.com/archives/linux-audit/2006-August/0035=
93.html" rel=3D"noreferrer" target=3D"_blank">https://listman.redhat.com/ar=
chives/linux-audit/2006-August/003593.html</a><br>
<br>
Al does mention that syscalls taking a descriptor should not be included. I=
 <br>
guess that can be cleaned up in the include/asm-generic/audit_*.h files.<br=
>
<br>
I think that patch would have landed in the 2.6.18 kernel. I found a 2.6.21=
 <br>
kernel and the path taken is different:<br>
<br>
audit_syscall_exit<br>
audit_get_context<br>
audit_filter_inodes=C2=A0 =C2=A0&lt;--- this is where it differs<br>
audit_filter_rules<br>
audit_match_perm<br>
<br>
In the old kernel, it still called the syscall filter. But I think that was=
 <br>
optimized later. But the whole point of making the perms field was so that =
<br>
user space could just tell the kernel what it needs and the kernel would <b=
r>
select exactly the syscalls needed. There was no other reason to have it.<b=
r>
<br>
Now, what to do about it? A watch was biarch. There were 2 tables for 32 &a=
mp; 64 <br>
bits and it would swing between them based on the syscall&#39;s arch. To fi=
x this <br>
in user space would mean a watch would have to create 2 rules to cover <br>
biarch. And some systems conceivably may not have 32 bit enabled or vice <b=
r>
versa. There would be no way for user space to know and work around a missi=
ng <br>
arch.<br>
<br>
The=C2=A0 -w notation really can&#39;t be optimized. It doesn&#39;t specify=
 an arch so it <br>
has to be &quot;all&quot;. I guess we can warn on that to rewrite in syscal=
l notation.<br>
<br>
-Steve<br>
<br>
&gt; The problem now is that user space has no list of syscalls that match =
each<br>
&gt; permission. And then, there&#39;s no good way to sync based on mixing =
and<br>
&gt; matching kernels and user space. The kernel may have an updated syscal=
l<br>
&gt; list user space doesn&#39;t know about and vice versa.<br>
&gt; <br>
&gt; I think you are on to something important. But I am surprised my conce=
pt of<br>
&gt; how it works doesn&#39;t match the implementation. (Al Viro did the or=
iginal<br>
&gt; implementation way back around 2006/7.) The best solution would be a<b=
r>
&gt; kernel modification so that there are no mismatched lists. A suboptima=
l<br>
&gt; solution would be to maintain 2 lists and hope they don&#39;t change. =
Which by<br>
&gt; the way, I think the kernel lists are outdated again. (Syscalls keep<b=
r>
&gt; getting added - quotactl_fd for example)<br>
&gt; <br>
&gt; -Steve<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Linux-audit mailing list<br>
&gt; <a href=3D"mailto:Linux-audit@redhat.com" target=3D"_blank">Linux-audi=
t@redhat.com</a><br>
&gt; <a href=3D"https://listman.redhat.com/mailman/listinfo/linux-audit" re=
l=3D"noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/listi=
nfo/linux-audit</a><br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000096d4900605e3fac1--

--===============1083857401169230775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============1083857401169230775==--

