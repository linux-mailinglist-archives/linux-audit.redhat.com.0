Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4466A6FBF
	for <lists+linux-audit@lfdr.de>; Wed,  1 Mar 2023 16:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677684733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=NubP1d0ajZIyOb+mw6W+cCRYeCwZ/dfwA08AI5O+gDA=;
	b=EdY/bMgXGvzvAAYXJqRhPxPQ43PQBgRFu0Hcn/r5jLxItAC+FnIRXkQGb4fHUrLmiENqAQ
	wHS+yW/Lxi7Dd+dbhPN6QOjf0RLs7kWxF4WjyJrt9JCqsJO06+z4uqqdqtijHhZHkmt4Hm
	EGTww0miu+0wAXj5lazVLHd8tZiQA0A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-Jf_E644rOzKfikm6sZVH1Q-1; Wed, 01 Mar 2023 10:32:09 -0500
X-MC-Unique: Jf_E644rOzKfikm6sZVH1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C36F384D02E;
	Wed,  1 Mar 2023 15:32:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF7902026D68;
	Wed,  1 Mar 2023 15:31:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D40DE1946A77;
	Wed,  1 Mar 2023 15:31:58 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB61819465B9 for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Mar 2023 15:31:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78C6D140EBF4; Wed,  1 Mar 2023 15:31:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70A77140EBF6
 for <linux-audit@redhat.com>; Wed,  1 Mar 2023 15:31:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 529183C18352
 for <linux-audit@redhat.com>; Wed,  1 Mar 2023 15:31:37 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-ayUxqLVGPxGb1ifAm-q30A-1; Wed, 01 Mar 2023 10:31:34 -0500
X-MC-Unique: ayUxqLVGPxGb1ifAm-q30A-1
Received: by mail-ua1-f42.google.com with SMTP id s23so1282470uae.5
 for <linux-audit@redhat.com>; Wed, 01 Mar 2023 07:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677684693;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qyLCAQLi19hsFPN4pKmYwM4dnn6LWyNzIwBUwcdWG6M=;
 b=tJ0TOxnUIF0DwjzY0aGDqTH1BEOjcBVuCbgqs4U1vwug42EzvShEmtJ/Oae+KNMrBs
 K6nCqmoyO+Lz4oA59tFTFLSCvF9fVfM99T4heFGr0gK8GRyymgVfA41Xvww5l2bORau6
 ppzH4hvdc7H2EY1XeR+59n1Og6qZZGhrUQ22QPamh5JPBDhWSiYo91FAplfv0nhNq0kt
 hZ3CpECfUwtE3FFBsyumaxP5cAW3HJnhJzQtFr/grmVDLzhZSrSB+cYeC2ctFcNmbUqD
 rw7HSTJeOPK0dQm1jzBXlorFfZrghTX0PzposoVhUrZdDhsuybnRbeQq5paTNtpHcqRi
 VXoQ==
X-Gm-Message-State: AO0yUKWG/N5AAaBO9NwCvBV9cQX4ZvNq8lS5PKIplONHDVjZeh/Cw3n1
 8k+waXMZTti6SnzrJJbjzeDLIZ/W7vCWScejNr7CuykR
X-Google-Smtp-Source: AK7set9Ker/y7lkK6PMm9bHHY9tcO3+95tC8V7QCUXUrbZQV6Kvk/DXoWbczzFH+Y1B5U39L/ZLGeP5EqgsAWbx/3C4=
X-Received: by 2002:ab0:53d4:0:b0:68e:2dce:3162 with SMTP id
 l20-20020ab053d4000000b0068e2dce3162mr4246220uaa.2.1677684693366; Wed, 01 Mar
 2023 07:31:33 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
 <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
 <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
In-Reply-To: <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Wed, 1 Mar 2023 21:01:23 +0530
Message-ID: <CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Lenny Bruzenak <lenny@magitekltd.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3722984524840917573=="

--===============3722984524840917573==
Content-Type: multipart/alternative; boundary="000000000000317e9905f5d86889"

--000000000000317e9905f5d86889
Content-Type: text/plain; charset="UTF-8"

>
>
> What we do not know is - do you have any filtering criteria in mind not
> covered by the available auditctl exclusions or do you just want to
> "sample" randomly?
>
> If the latter, why bother auditing this with a rule at all? You might be
> able to remove the rule causing the events and do something in userspace
> to audit only what you really want.
>
>
We want to sample system calls like rename.
In many cases, we have seen this overburden and increase auditd cpu
consumption.
In such cases, we want to drop some events randomly, so as to keep cpu
consumption under control.

There are other rules also, for example monitoring login/logout.
For such rules we do not want to drop any event.

--
Anurag Aggarwal

--000000000000317e9905f5d86889
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><br>
What we do not know is - do you have any filtering criteria in mind not <br=
>
covered by the available auditctl exclusions or do you just want to <br>
&quot;sample&quot; randomly?<br>
<br>
If the latter, why bother auditing this with a rule at all? You might be <b=
r>
able to remove the rule causing the events and do something in userspace <b=
r>
to audit only what you really want.<br>
<br></blockquote><div><br></div><div>We want to sample system calls like re=
name.</div><div>In many cases, we have seen this overburden and increase au=
ditd cpu consumption.</div><div>In such=C2=A0cases, we want to drop some ev=
ents randomly, so as to keep cpu consumption under control.</div><div><br><=
/div><div>There are other rules also, for=C2=A0example monitoring login/log=
out.=C2=A0</div><div>For such rules we do not want to drop any event.</div>=
<div><br></div><div>--<br></div></div><div dir=3D"ltr" class=3D"gmail_signa=
ture">Anurag Aggarwal<br></div></div>

--000000000000317e9905f5d86889--

--===============3722984524840917573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============3722984524840917573==--

