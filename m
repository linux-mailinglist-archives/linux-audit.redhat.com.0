Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 276177BD053
	for <lists+linux-audit@lfdr.de>; Sun,  8 Oct 2023 23:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696800887;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ujPrnUoxXT13YfczZNvaJ+PbDg7DT/t/TKZGtKC7Zsw=;
	b=hgPslLkmWkh0PvciqX0i9tu6UCWhZrY1413KYjz1cqHxRUnywmkPGsZNX+oKccxMw/O88r
	vGHE9fevZM6H+ziD42H7Qa21lXRZBcNLIUiXZ/KqBSjEgrBLv/z4XUHZ13li5x18MnYgGq
	4CFtu2aAAcFpFjq+oZES0tIaMLKeD8g=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-sZJCQ6L0NXqyURA12n1rFw-1; Sun, 08 Oct 2023 17:34:41 -0400
X-MC-Unique: sZJCQ6L0NXqyURA12n1rFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE2AD3C02B61;
	Sun,  8 Oct 2023 21:34:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4382C185EE;
	Sun,  8 Oct 2023 21:34:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 05C7919466E5;
	Sun,  8 Oct 2023 21:34:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A9581946589 for <linux-audit@listman.corp.redhat.com>;
 Sun,  8 Oct 2023 04:46:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 346CD1006B72; Sun,  8 Oct 2023 04:46:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D44E1005E2A
 for <linux-audit@redhat.com>; Sun,  8 Oct 2023 04:46:45 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F10AA810BDB
 for <linux-audit@redhat.com>; Sun,  8 Oct 2023 04:46:44 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-DkNUU-_pM8yQyDMezaUPOw-1; Sun, 08 Oct 2023 00:46:42 -0400
X-MC-Unique: DkNUU-_pM8yQyDMezaUPOw-1
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4190890d201so19580001cf.2; 
 Sat, 07 Oct 2023 21:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696740401; x=1697345201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J4ikmDgKNPOPEcve9njwzqZfp9x4FOy4Bx9ERG2M4Yk=;
 b=w47bCDnGbVcacUX46l4OVC388H5Avmpo+L3LaEx42Qu8vea6OlCnF6joPuQhKcz8r8
 JLB3ox+ZQRbDAD/18DrQrdmIObCHLsmtC9PWRYJgbIL0MxJ8mcRaZRP7jcPJ05bQkxLp
 kgHo/FlkU9avOZ12oKQZyoB2IRvu+oy2n1OKJu58/5rjbfSOIhKe6XS8sKJRX3ob1/t1
 0p7q+3MLFlJnh/+R2ZqH1EGg1ZUWVT6yQ/3lDBf6cA7KUHFLzoE6mAHLSOyV0C1enG4r
 h7TyxiFhXkZKbajJ4MaAKeu53P55mDpr97m6+F1Ut7ONTpIeiAtWm67MEOG+qLynmGDf
 xd3Q==
X-Gm-Message-State: AOJu0Yw5h0AmZXShifQhdTGRoDW5VfNqiIN0pe4t4cmRubUbd2tB0nlg
 8mlUtBUozxznx0ixEG0P49VclUcbgw0S7mkpq9LWz5XBfAM=
X-Google-Smtp-Source: AGHT+IFqi0orXtkRGuAg5bWTtzSZpHr6ui6ytfUZSjzROw0/1IzvqoRwEP63JQ1dP5S1ZIvH7hrNdmd//aLBGuefB+s=
X-Received: by 2002:ac8:5a4e:0:b0:405:464d:5bb0 with SMTP id
 o14-20020ac85a4e000000b00405464d5bb0mr12971193qta.32.1696740401539; Sat, 07
 Oct 2023 21:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJcJf=Qb7muwWG4DyQtEcCKmCOETD4H3h1BoGrewJ5u26r6o=w@mail.gmail.com>
 <CAJcJf=RKAqp0PPQ2EmOZ5jJ6KGZ4rAvmabdDsg+MvkbmcomChA@mail.gmail.com>
 <4866749.31r3eYUQgx@x2> <3262512.44csPzL39Z@x2>
 <CAJcJf=Ss2Fz3932cE+Fxf4rGMUrbNOPEZ1i3xAQmz_x+XbVbGg@mail.gmail.com>
In-Reply-To: <CAJcJf=Ss2Fz3932cE+Fxf4rGMUrbNOPEZ1i3xAQmz_x+XbVbGg@mail.gmail.com>
From: Amjad Gabbar <amjadgabbar11@gmail.com>
Date: Sat, 7 Oct 2023 23:46:30 -0500
Message-ID: <CAJcJf=QJYgrR_+PJekYTcUJ+Kk2wpcuH-LKFDTQ_0jj1k-EdNQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============8759640658854739157=="

--===============8759640658854739157==
Content-Type: multipart/alternative; boundary="000000000000e8ee4d06072d28e9"

--000000000000e8ee4d06072d28e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested out all different combinations and performed performance experiments
and tests using different permutations and combinations of rules.

Can confirm the changes work as expected.

1. The old -w rule format is slower since it encompasses 'all' syscalls. A
warning is emitted on using the -w notation that 'Old style watch rules are
slower'.

2. On making use of the syscall format but without specifying the arch, a
warning is emitted - 'perm used without an arch is slower`.
The rules are similar to the old style -w watch rules encompassing 'all'
syscalls and hampering performance significantly.

3. On specifying an arch with the syscall format, the respective syscalls
are added based on the permissions field. Tested all different permissions
to ensure that the respective syscalls are added.
Works as expected and massively improves performance as well.

Thanks for working together on this. Hopefully the end users are able to
see the boost in performance post these changes.

Regards
Ali Adnan

On Fri, Sep 29, 2023 at 11:39=E2=80=AFAM Amjad Gabbar <amjadgabbar11@gmail.=
com>
wrote:

> Sounds good. I will test this out.
>
> Regards
> Ali Adnan
>
> On Thu, Sep 28, 2023 at 11:30 AM Steve Grubb <sgrubb@redhat.com> wrote:
>
>> On Thursday, September 28, 2023 11:53:26 AM EDT Steve Grubb wrote:
>> > On Thursday, September 21, 2023 4:02:49 PM EDT Amjad Gabbar wrote:
>> > > > The best solution would be a kernel modification so that there are
>> no
>> > > > mismatched lists.
>> > >
>> > > I agree as well....This would be the cleanest solution. This would
>> also
>> > > solve the userspace problem of maintaining different lists which can
>> get
>> > > out of hand fairly quickly.
>> >
>> > After looking into this, a kernel patch would also not work well. It
>> has to
>> > be arch specific
>> >
>> > > > I guess we can warn on that to rewrite in syscall notation.
>> > >
>> > > We certainly should. I think the user should know that there is a
>> > > performance cost associated with watches and we should explicitly
>> mention
>> > > how it can be optimized in the manpages also. The reason being I am
>> > > pretty sure, numerous users/repos still do make use of the -w notati=
on
>> > > and we do want to let them know the issue here. We also need to make
>> > > quite a few changes to the manpages also regarding this. Because,
>> > > initially even I was  very confused when reading the man pages and
>> seeing
>> > > the actual implementation of and results were not quite in sync.
>> >
>> > I have made the changes to the master and audit-3.1-maint branches.
>> Please
>> > everyone concerned give them tests. The short of it is that if you use
>> the
>> > '- w' notation for watches, it will remain the same and slower.
>>
>> Actually, ths is the one that draws the warning to urge people to migrat=
e.
>>
>> > If you use
>> > the syscall notation without "-F arch", you will get a warning that it
>> > cannot be optimized without adding "-Farch".
>>
>> Actually, you won't in order to preserve intentional behavior.
>>
>> > If you add "-F arch", you
>> > will possibly need one for both arches which means doubling the rules.
>> If
>> > you do not want to double the rules, you might place a syscall rule fo=
r
>> > any 32 system call (21-no32bit.rules). Or you can leave it as is and n=
ot
>> > care. The sample rules and all man pages have been updated.
>>
>> I should have provided an example of what this means. If you have this
>> kind
>> of rule:
>>
>> -w /etc/shadow -p wa -k shadow
>>
>> And when applied draws a warning:
>>
>> # auditctl -w /etc/shadow -p wa -k shadow
>> Old style watch rules are slower
>>
>> It should be rewritten as
>>
>> -a always,exit -F arch=3Db64 -F path=3D/etc/shadow -F perm=3Dwa -F key=
=3Dshadow
>>
>> Then it looks like this when loaded:
>>
>> #auditctl -l
>> -a always,exit -F arch=3Db64 -S
>> open,bind,truncate,ftruncate,rename,mkdir,rmdir,creat,link,unlink,symlin=
k,chmod,fchmod,chown,fchown,lchown,mknod,acct,swapon,quotactl,setxattr,lset=
xattr,fsetxattr,removexattr,lremovexattr,fremovexattr,openat,mkdirat,mknoda=
t,fchownat,unlinkat,renameat,linkat,symlinkat,fchmodat,fallocate,renameat2,=
openat2
>> -F path=3D/etc/shadow -F perm=3Dwa -F key=3Dshadow
>>
>> And to delete  the rule,
>> auditctl -d always,exit -F arch=3Db64 -F path=3D/etc/shadow -F perm=3Dwa=
 -F
>> key=3Dshadow
>>
>> or the long way
>>
>> auditctl -d always,exit -F arch=3Db64 -S
>> open,bind,truncate,ftruncate,rename,mkdir,rmdir,creat,link,unlink,symlin=
k,chmod,fchmod,chown,fchown,lchown,mknod,acct,swapon,quotactl,setxattr,lset=
xattr,fsetxattr,removexattr,lremovexattr,fremovexattr,openat,mkdirat,mknoda=
t,fchownat,unlinkat,renameat,linkat,symlinkat,fchmodat,fallocate,renameat2,=
openat2
>> -F path=3D/etc/shadow -F perm=3Dwa -F key=3Dshadow
>>
>> Hopefully this is clearer what the change is.
>>
>> -Steve
>>
>>
>>
>>

--000000000000e8ee4d06072d28e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested out all different combinations and performed perfor=
mance experiments and tests using different permutations and combinations o=
f rules.<br><br>Can confirm the changes work as expected.<br><br>1. The old=
 -w rule format is slower since it encompasses &#39;all&#39; syscalls. A wa=
rning is emitted on using the -w notation that &#39;Old style watch rules a=
re slower&#39;.<br><br>2. On making use of the syscall format but without s=
pecifying the arch, a warning is emitted - &#39;perm used without an arch i=
s slower`.<br>The rules are similar to the old style -w watch rules encompa=
ssing &#39;all&#39; syscalls and hampering performance significantly.<br><b=
r>3. On specifying=C2=A0an arch with the syscall format, the respective sys=
calls are added based on the permissions field. Tested all different permis=
sions to ensure that the respective syscalls are added.<br>Works as expecte=
d and massively improves performance as well.<br><br>Thanks for working tog=
ether on this. Hopefully the end users are able to see the boost in perform=
ance post these changes.<br><br>Regards=C2=A0<br>Ali Adnan</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 29, 2=
023 at 11:39=E2=80=AFAM Amjad Gabbar &lt;<a href=3D"mailto:amjadgabbar11@gm=
ail.com">amjadgabbar11@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"auto">Sounds good. I will test=
 this out.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div>=
<div dir=3D"auto">Ali Adnan</div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 28, 2023 at 11:30 AM Steve Grub=
b &lt;<a href=3D"mailto:sgrubb@redhat.com" target=3D"_blank">sgrubb@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thursday, September 28, 2023 11:53:26 AM EDT Steve Grubb wrote:<br>
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
</blockquote></div>

--000000000000e8ee4d06072d28e9--

--===============8759640658854739157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============8759640658854739157==--

