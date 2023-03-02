Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 156966A7ABE
	for <lists+linux-audit@lfdr.de>; Thu,  2 Mar 2023 06:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677734026;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7Wv+Y7W5MZvK5hXO9nFaXb3jPHtYbiRsJmYvQmnzEqw=;
	b=A/LKPmVxGfbANUOKHowR9VemgjjxoxA+B335HMjBetnb2KjSd9MgZcauievQbBWiO7OYcp
	X65ujwOvHgNgFiKdaCY0dQbjwyveXpfLRHya7oHTSZ98/W7xbffGD31MoGkn0yJEy8scLh
	BUvsdsVvfnEUl1UgszuMCYezns24GJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-hhAZ2TAnOdy-6yjlo26jNA-1; Thu, 02 Mar 2023 00:13:43 -0500
X-MC-Unique: hhAZ2TAnOdy-6yjlo26jNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0499811E9C;
	Thu,  2 Mar 2023 05:13:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9586EC15BAD;
	Thu,  2 Mar 2023 05:13:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA3451948641;
	Thu,  2 Mar 2023 05:13:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2634F19472FC for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 05:13:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0AC1CC15BAD; Thu,  2 Mar 2023 05:13:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0364FC15BA0
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 05:13:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC77329AB3F3
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 05:13:33 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-hUnQNC8MPp-_4-Rm_pIh_g-1; Thu, 02 Mar 2023 00:13:31 -0500
X-MC-Unique: hUnQNC8MPp-_4-Rm_pIh_g-1
Received: by mail-ua1-f41.google.com with SMTP id l24so5384576uac.12
 for <linux-audit@redhat.com>; Wed, 01 Mar 2023 21:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677734011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7IY7yvs5cDXKqgJbkDlRDKwkrrd2bIuSH92Nm6s8KI=;
 b=U2xruqse5fycWRcpx+g497SuZY3qc0SKjbC7pCoY2uoevJGKxFOko/tanXBHHS4vR8
 LnkrVDCbS4i3+mMxYs00OZsizWbkUD5vcCfXH6NRbg4qx+US3ZlW0b16erl8CmE0Os3z
 zXdpdXQHz60wilDzzMDB4LhQ1Ryyb3+sy7wh6vKhdqvb0vpVhxW9JyzPmfptqraowObD
 ogTyRSuOLx3/PWIQORIkVXzYavEYImfAL7bHENggjPFl0Gjr1R7xqLhXygyPsA0ZIT3c
 JYmeQs2hhPlUQM+S5WcWQHFEUfPiFIMiNCvVvQ3ZYeCn+hF0WLS8kVj4VNfr8wMSz4Va
 PZow==
X-Gm-Message-State: AO0yUKWYoZ4AFa3YCq+ygGz5YJ0gZJfXXdX0G0C9mVscB3EpJgXZIYcx
 wJvIioXuFXAAYTFUPt7suyhivQxDhQ+8/SXG2h6Gh4gg
X-Google-Smtp-Source: AK7set+i/eB95OAC9uTCsWPqVDg8TZF1OF+UDOBrQ60IkFmb95UiZwMKZVnQKh5EoNjd7XxONGrYo02p5MylxqwuPhE=
X-Received: by 2002:a05:6122:1382:b0:3ea:b7db:61c with SMTP id
 m2-20020a056122138200b003eab7db061cmr4839560vkp.2.1677734010727; Wed, 01 Mar
 2023 21:13:30 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
 <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
 <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
 <CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com>
 <37a373df-97cd-133a-381f-6d6d4b20c3fa@magitekltd.com>
In-Reply-To: <37a373df-97cd-133a-381f-6d6d4b20c3fa@magitekltd.com>
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Thu, 2 Mar 2023 10:43:21 +0530
Message-ID: <CAPoNrtvj1xXDXfgNe=r2ETqYYODqXqYn6LX=w=eGYon1PO2TBA@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Lenny Bruzenak <lenny@magitekltd.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4173496789073725994=="

--===============4173496789073725994==
Content-Type: multipart/alternative; boundary="000000000000bcb17c05f5e3e30a"

--000000000000bcb17c05f5e3e30a
Content-Type: text/plain; charset="UTF-8"

>
> Or if selinux is in force, create policy for the events you definitely
> want, then look for those types (either subject or object) in your rule.
> This is something I've seen before, where renames that are desired to be
> audited use the provided system tools, but for locally developed
> application code, they are made to run inside a certain type of a custom
> executable and then that type is excluded from the rename syscall rule.
> Ideally, the code which is written would self-audit a 1-liner like "I am
> going to rename every file under dir /opt/special/stuff/" using
> audit_log_user_message so you still have some idea what is happening (if
> you care).
>
> Then your "my-rename" program subject type of my_rename_t can be used as
> an exclude on the rule. Of course, the caller must then know to use this
> rather than the standard utilities.
>

This sounds useful and might solve our problem, will it be possible to
share some examples on how this can be achieved?

-- 
Anurag Aggarwal

--000000000000bcb17c05f5e3e30a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div><p>Or if selinux is in force, create policy for the=
 events you
      definitely want, then look for those types (either subject or
      object) in your rule. This is something I&#39;ve seen before, where
      renames that are desired to be audited use the provided system
      tools, but for locally developed application code, they are made
      to run inside a certain type of a custom executable and then that
      type is excluded from the rename syscall rule. Ideally, the code
      which is written would self-audit a 1-liner like &quot;I am going to
      rename every file under dir /opt/special/stuff/&quot; using
      audit_log_user_message so you still have some idea what is
      happening (if you care).<br></p>
    <p>Then your &quot;my-rename&quot; program subject type of my_rename_t =
can be
      used as an exclude on the rule. Of course, the caller must then
      know to use this rather than the standard utilities.</p></div></block=
quote><div><br></div><div>This sounds useful and might solve our problem, w=
ill it be possible to share some examples on how this can be achieved?=C2=
=A0=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature">Anurag Aggarwal<br></div></div>

--000000000000bcb17c05f5e3e30a--

--===============4173496789073725994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============4173496789073725994==--

