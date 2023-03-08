Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8E6B0BF5
	for <lists+linux-audit@lfdr.de>; Wed,  8 Mar 2023 15:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678287306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cTONVpsbM/Q5/1/jVnU0vcNsRzr1DVsADVvZvluiavk=;
	b=g0jsYX90p0wGfQwdaNKyV0lzgeu28o2aVtkYoTO9bwLND+dCejuQGr9BkVs5tcaIwx8qCk
	HpqeedCTAJQwSWPPYpCxth0jE/tyLhAl8kihPd4VfIgATJ32I7FdfSdY1vzNAFzSz+PODF
	mKVdU9M3WCZQh60S0A2m0OvBM6sAILQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-YXzFU60JPFiFlaReaSz0og-1; Wed, 08 Mar 2023 09:55:05 -0500
X-MC-Unique: YXzFU60JPFiFlaReaSz0og-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33EFC3804521;
	Wed,  8 Mar 2023 14:55:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30464492B02;
	Wed,  8 Mar 2023 14:55:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 691D71946A42;
	Wed,  8 Mar 2023 14:54:59 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3921419465B1 for <linux-audit@listman.corp.redhat.com>;
 Wed,  8 Mar 2023 13:47:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1BA96492B05; Wed,  8 Mar 2023 13:47:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1391B492B04
 for <linux-audit@redhat.com>; Wed,  8 Mar 2023 13:47:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC0661C12986
 for <linux-audit@redhat.com>; Wed,  8 Mar 2023 13:47:12 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-FPHeMWgLPxyj9q6WLoJHxQ-1; Wed, 08 Mar 2023 08:47:10 -0500
X-MC-Unique: FPHeMWgLPxyj9q6WLoJHxQ-1
Received: by mail-ed1-f46.google.com with SMTP id k10so42040876edk.13
 for <linux-audit@redhat.com>; Wed, 08 Mar 2023 05:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678283229;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UBvBY+jR5z8qBOxcYi0PLL3VabnW2rwa2QEVvuodIBc=;
 b=bSy1KyqghasTihMCHUioznu6pG3PQeew+nR99b11RMuxFQBBHcSRa+Jy+Kza/cUcYj
 0LvRTurV9yT4OclwLvJONZFMiuOVgPdivj5X4VCMR/WGgxTkPGDz7Om0AA0G/yIcg+rU
 fK4dWHZx8eezD0HINR+umQC3mKDc728paIMetRSptTLWRG4mfcCIvDLYX0JbLYJYB9HH
 jP4oo/WCWB+c3gExX+oI1SuvjJHQqv961LZZm4+H/iFt3KMZSpdB0D62sNNfUMylyvlY
 J/AGKW9hUVCyyEneoaa3OCYpar3zKpQsKJgnUNdy3I5kQ8Jy6cgE/5dLk9VUncacaucG
 MZKA==
X-Gm-Message-State: AO0yUKXl4y/oeaP2fEyjGhtYwdxeW889Q3tKZZRIbkOkwtYIx6F0cIDx
 +sISYhN2iRMV3TvwSw/DFE4s5+NLJcN84fSHagIHNWo4prI=
X-Google-Smtp-Source: AK7set9Ll5j4H2WUPioFSPsiS6x05OHMWQnFTLcV9iuOG0yi8O5Hoa5TqJhb/iruo9cUtFzXuORLBZcvU5iKQrjlbas=
X-Received: by 2002:a17:906:398a:b0:877:747e:f076 with SMTP id
 h10-20020a170906398a00b00877747ef076mr8515335eje.0.1678283229325; Wed, 08 Mar
 2023 05:47:09 -0800 (PST)
MIME-Version: 1.0
From: Richard Du <duxiong@gmail.com>
Date: Wed, 8 Mar 2023 21:46:57 +0800
Message-ID: <CAH2vwOt3yCNhcLc+7QWvRAvSoNmtCJDpC4m41_sno7u_Rmf88A@mail.gmail.com>
Subject: How to define audit rule for one bit *not* set for a syscall argument?
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Wed, 08 Mar 2023 14:54:58 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1156014874532477593=="

--===============1156014874532477593==
Content-Type: multipart/alternative; boundary="000000000000b76c1005f663c358"

--000000000000b76c1005f663c358
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm trying to define an audit rule with auditctl for clone() syscall, and I
would expect that the a0 of clone() syscall (i.e. the clone_flags argument)
without the CLONE_THREAD flag bit being set.

int clone(int (*fn)(void *), void *stack, int flags, void *arg, ...
                 /* pid_t *parent_tid, void *tls, pid_t *child_tid */ );

From man page of auditctl, -F option build a rule file: name, operation,
value.
-F [n=v | n!=v | n<v | n>v | n<=v | n>=v | n&v | n&=v]

I can understand that, the n&v (Audit_bitmask) means any bit of a bitmast
is set, and the n&=v (Audit_bittest) means all bits of a bitmask are set.

While my question is, how to build a rule which means "none of bit of a
bitmask is set", i.e. ( ! n&=v ). If the current audit comparator dosen't
support this, can we add the support in furture?

Thanks,
Richard

--000000000000b76c1005f663c358
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>I&#39;m trying to define an =
audit rule with auditctl for clone() syscall, and I would expect that the a=
0 of clone() syscall (i.e. the clone_flags argument) without the CLONE_THRE=
AD flag bit being set.</div><div><br></div><div>int clone(int (*fn)(void *)=
, void *stack, int flags, void *arg, ...<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* pid_t *parent_tid, void *tls, pid_t *chil=
d_tid */ );<br></div><div><br></div><div>From man page of auditctl, -F opti=
on build a rule file: name, operation, value.<br>-F [n=3Dv | n!=3Dv | n&lt;=
v | n&gt;v | n&lt;=3Dv | n&gt;=3Dv | n&amp;v | n&amp;=3Dv]<br><br>I can und=
erstand that, the n&amp;v (Audit_bitmask) means any bit of a bitmast is set=
, and the n&amp;=3Dv (Audit_bittest) means all bits of a bitmask are set.<b=
r><br></div><div>While my question is, how to build a rule which means &quo=
t;none of bit of a bitmask is set&quot;, i.e. ( ! n&amp;=3Dv=C2=A0). If the=
 current audit comparator dosen&#39;t support this, can we add the support =
in furture?<br><br>Thanks,<br>Richard</div></div>

--000000000000b76c1005f663c358--

--===============1156014874532477593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============1156014874532477593==--

