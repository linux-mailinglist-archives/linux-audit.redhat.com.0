Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B016B25DC
	for <lists+linux-audit@lfdr.de>; Thu,  9 Mar 2023 14:51:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678369870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UixjFMj6pwI0yJzsl7nj6Wvp2Ju5qQuq0Ti9oPXqk4o=;
	b=HSumojQ8MSXjGc6XroMqNUym45oE4KD12durFH6zUNvlAcfu3xpY+T2E3T+9d5uW+BUu54
	2a3sGlC6DsVdNOWKHYbSpofx8Xs4TbbOa8y0edwaWi3U477H37s7X6FdSPaYBYLaAupFdD
	88chLg2tQ5r9WRCynwmrDe2oR8Ki+nU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-XEz5w80bO3WYUFNZ5gYRZQ-1; Thu, 09 Mar 2023 08:51:08 -0500
X-MC-Unique: XEz5w80bO3WYUFNZ5gYRZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAAC2802D38;
	Thu,  9 Mar 2023 13:51:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACA4D40ED76E;
	Thu,  9 Mar 2023 13:50:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D790019466DF;
	Thu,  9 Mar 2023 13:50:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02C5519465B5 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 02:07:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE38C492B00; Thu,  9 Mar 2023 02:07:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C62EF492C3E
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 02:07:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9AC629AA2C1
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 02:07:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-pO7k7QncP3isDFs7-MEClA-1; Wed, 08 Mar 2023 21:07:27 -0500
X-MC-Unique: pO7k7QncP3isDFs7-MEClA-1
Received: by mail-ed1-f52.google.com with SMTP id ay14so1219356edb.11;
 Wed, 08 Mar 2023 18:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678327645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gKlpsWVdngj9nu0vEzW1jA9a/N7Fr/EfBDeLVlVnPcc=;
 b=EGrDIbGicgHHvZqiBdxMixMcDlbWE/gQVEkKAZPRJXcxbG4Kf2YieyFN0izoFnIBH6
 oqHaWJblyFixaz5quLWnoR01rZ7Dj8ONKgIKVeKktWRKOuK6eZYsOggXcx0YsMWvOaB5
 snrvEkKgkfjOZ2NvaqaImFXElpHCbNvqIeDbJNkuKrmXT3qPWN83wV8GrzlISCA8iweT
 DPUsW18do4e9VbTPojnOLUp499CCMbaelPyEMX241pX1VyoGmKMcOs/uEeK0lItow/0P
 r2325xyZIyCbszfbUBhNK7PcIMQ7rxXPufsfKP2dYPb1NxhIVRWp48TyT5QLc51ASyKq
 wicQ==
X-Gm-Message-State: AO0yUKVPeajbgR2yuuGfUj8kjR3nLZroE+/aA9J0f29xU0MbP166Spho
 WEUz4bWyWmvZ/vUUnxlTgbvXKPtQqS54rwHnDHwWzjh7NLw=
X-Google-Smtp-Source: AK7set/wCSZpX+Gf4facAjizNX5y+3Yas8kz6e1e1MmvYZQoPO+2gGVdP8fsCjhjj4Q9ZWgu283x98dPmfMd2PydmmM=
X-Received: by 2002:a50:d60d:0:b0:4bc:edde:14ff with SMTP id
 x13-20020a50d60d000000b004bcedde14ffmr10816660edi.0.1678327645457; Wed, 08
 Mar 2023 18:07:25 -0800 (PST)
MIME-Version: 1.0
References: <CAH2vwOt3yCNhcLc+7QWvRAvSoNmtCJDpC4m41_sno7u_Rmf88A@mail.gmail.com>
 <12326100.O9o76ZdvQC@x2>
In-Reply-To: <12326100.O9o76ZdvQC@x2>
From: Richard Du <duxiong@gmail.com>
Date: Thu, 9 Mar 2023 10:07:14 +0800
Message-ID: <CAH2vwOvV+vBOejtyKR8bsjV-7Voe32kvjuqF4wa_p2o-Wz1MBg@mail.gmail.com>
Subject: Re: How to define audit rule for one bit *not* set for a syscall
 argument?
To: Steve Grubb <sgrubb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 09 Mar 2023 13:50:57 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6993446987303436865=="

--===============6993446987303436865==
Content-Type: multipart/alternative; boundary="0000000000001fd10905f66e1b64"

--0000000000001fd10905f66e1b64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, the case is that we would like to filter out the "thread creation" and
only keep the "process creation", by excluding the CLONE_THREAD flag bit of
a0 of clone() syscall.
Without the audit comparator support for this case, we have to filter out
the "thread creation" in user space which introduces a performance penalty.

Regards,
Richard

On Thu, Mar 9, 2023 at 6:22=E2=80=AFAM Steve Grubb <sgrubb@redhat.com> wrot=
e:

> Hello,
>
> On Wednesday, March 8, 2023 8:46:57 AM EST Richard Du wrote:
> > I'm trying to define an audit rule with auditctl for clone() syscall,
> and I
> > would expect that the a0 of clone() syscall (i.e. the clone_flags
> > argument) without the CLONE_THREAD flag bit being set.
> >
> > int clone(int (*fn)(void *), void *stack, int flags, void *arg, ...
> >                  /* pid_t *parent_tid, void *tls, pid_t *child_tid */ )=
;
> >
> > From man page of auditctl, -F option build a rule file: name, operation=
,
> > value.
> > -F [n=3Dv | n!=3Dv | n<v | n>v | n<=3Dv | n>=3Dv | n&v | n&=3Dv]
> >
> > I can understand that, the n&v (Audit_bitmask) means any bit of a bitma=
st
> > is set, and the n&=3Dv (Audit_bittest) means all bits of a bitmask are =
set.
> >
> > While my question is, how to build a rule which means "none of bit of a
> > bitmask is set", i.e. ( ! n&=3Dv ). If the current audit comparator dos=
en't
> > support this, can we add the support in furture?
>
> The comparator does not support this. This is a corner case in which this
> is
> the first time someone ever needed it.
>
> -Steve
>
>
>

--0000000000001fd10905f66e1b64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, the case is that we would like to filter out the=
 &quot;thread creation&quot; and only keep the &quot;process creation&quot;=
, by excluding the CLONE_THREAD flag bit of a0 of clone() syscall.</div><di=
v>Without the audit comparator support for this case, we have to filter out=
 the &quot;thread creation&quot; in user space which introduces a performan=
ce penalty.</div><div><br></div><div>Regards,</div><div>Richard</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar =
9, 2023 at 6:22=E2=80=AFAM Steve Grubb &lt;<a href=3D"mailto:sgrubb@redhat.=
com">sgrubb@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello,<br>
<br>
On Wednesday, March 8, 2023 8:46:57 AM EST Richard Du wrote:<br>
&gt; I&#39;m trying to define an audit rule with auditctl for clone() sysca=
ll, and I<br>
&gt; would expect that the a0 of clone() syscall (i.e. the clone_flags<br>
&gt; argument) without the CLONE_THREAD flag bit being set.<br>
&gt; <br>
&gt; int clone(int (*fn)(void *), void *stack, int flags, void *arg, ...<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* pid_t=
 *parent_tid, void *tls, pid_t *child_tid */ );<br>
&gt; <br>
&gt; From man page of auditctl, -F option build a rule file: name, operatio=
n,<br>
&gt; value.<br>
&gt; -F [n=3Dv | n!=3Dv | n&lt;v | n&gt;v | n&lt;=3Dv | n&gt;=3Dv | n&amp;v=
 | n&amp;=3Dv]<br>
&gt; <br>
&gt; I can understand that, the n&amp;v (Audit_bitmask) means any bit of a =
bitmast<br>
&gt; is set, and the n&amp;=3Dv (Audit_bittest) means all bits of a bitmask=
 are set.<br>
&gt; <br>
&gt; While my question is, how to build a rule which means &quot;none of bi=
t of a<br>
&gt; bitmask is set&quot;, i.e. ( ! n&amp;=3Dv ). If the current audit comp=
arator dosen&#39;t<br>
&gt; support this, can we add the support in furture?<br>
<br>
The comparator does not support this. This is a corner case in which this i=
s <br>
the first time someone ever needed it.<br>
<br>
-Steve<br>
<br>
<br>
</blockquote></div></div>

--0000000000001fd10905f66e1b64--

--===============6993446987303436865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============6993446987303436865==--

