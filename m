Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AD6AB622
	for <lists+linux-audit@lfdr.de>; Mon,  6 Mar 2023 06:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678081710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mfPk0H+f8t4FQ3v6M1Plv/ceXtiBNf6GCD7m0WeA8eQ=;
	b=V5GvEDd5zpbmvWqvnGQ5gKYmEJnjYMCprFFB3krXdzVnBW2zaj0bJQiO53U8vKXycAMmHt
	2EsKLsk1SJLjGe7IukfjgEqwuZjBSeuISATcEV/k1lJZn+cxjnKR/+zfT8EORmfGm9g7lz
	pmnk+4EAlW7e5eoGqEKQwlQvISsGuYI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Q7T-FE6tPxG5yJgIX6uttQ-1; Mon, 06 Mar 2023 00:48:26 -0500
X-MC-Unique: Q7T-FE6tPxG5yJgIX6uttQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6079985A5A3;
	Mon,  6 Mar 2023 05:48:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2276BC1602A;
	Mon,  6 Mar 2023 05:48:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E8DA219465A2;
	Mon,  6 Mar 2023 05:48:14 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E8B3F1946586 for <linux-audit@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 05:48:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 988E8112132D; Mon,  6 Mar 2023 05:48:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9119A1121314
 for <linux-audit@redhat.com>; Mon,  6 Mar 2023 05:48:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7302785A588
 for <linux-audit@redhat.com>; Mon,  6 Mar 2023 05:48:13 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-Jm43cQi9MCqXNvwxYBwqIw-1; Mon, 06 Mar 2023 00:48:11 -0500
X-MC-Unique: Jm43cQi9MCqXNvwxYBwqIw-1
Received: by mail-ua1-f53.google.com with SMTP id bx14so5677074uab.0
 for <linux-audit@redhat.com>; Sun, 05 Mar 2023 21:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678081690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YRZXq0q6QTZGV2fi4/yo0wTLrkZb20mz+MJdSRXZjyg=;
 b=TpaaXDa+qgRumQHxV1qbWFechaIRfFCTKqA+xn/nvsWIyP/mEq+UeAWfqD16NzEzz8
 +zI0NFDGcETiKi8PcaIuUSnsEpi5E+/48tCZOuEZnoYtszhXCx4yKVjBuVL9eFCGYdDT
 4ZHgOWxFvL+qTF76fZ3mu0CVpJry+uW7UMs8x5PJwWlGUzraBD0WYSSVbwycdKxd1qKm
 Hj4lOnNvG8S5/1Nh3Ra7An0gnk+GiXPWTgkSu3+Zj0gvXJcZzi9zQsgHlHxud3OrxUFY
 mfUQlheL7lHXumYg2TlZO0jeX44C4SXmTEcA+5lYhoO20GOfesx2iaeoq++09wQ3liWs
 v9ww==
X-Gm-Message-State: AO0yUKUo+UyTDuOr+NHICDvsARt9cvBX+RY+hVqtIf0F1prILaxL+oLW
 4Am+FMSFxBybfDRoF0+ZOmN8dEcB4TaTuxb2XcLoaOHUlXo=
X-Google-Smtp-Source: AK7set9qfIubazgzar1mLD+S4AumAkPzYjUaCoCepDN7+oxF3fg4hDHBcKANKxq+tZ49kMsvMc7cMnaAUYaqScNt7kg=
X-Received: by 2002:a9f:3149:0:b0:68b:923a:d6f4 with SMTP id
 n9-20020a9f3149000000b0068b923ad6f4mr6057500uab.2.1678081690558; Sun, 05 Mar
 2023 21:48:10 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
 <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
 <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
 <CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com>
 <37a373df-97cd-133a-381f-6d6d4b20c3fa@magitekltd.com>
 <CAPoNrtvj1xXDXfgNe=r2ETqYYODqXqYn6LX=w=eGYon1PO2TBA@mail.gmail.com>
 <ba3891d6-21ed-9e86-6bf9-c049ae8a1b3b@magitekltd.com>
 <CAHC9VhRTMMW8ArLTNk-cuYpiQzU+VyKvdg6+HfqWX3yS7RtK1A@mail.gmail.com>
In-Reply-To: <CAHC9VhRTMMW8ArLTNk-cuYpiQzU+VyKvdg6+HfqWX3yS7RtK1A@mail.gmail.com>
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Mon, 6 Mar 2023 11:18:00 +0530
Message-ID: <CAPoNrttPJ_87exec3x4FYcPJp6w9jKYwHyFbLCP9yYjBhn6jsA@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Content-Type: multipart/mixed; boundary="===============2168615581092515409=="

--===============2168615581092515409==
Content-Type: multipart/alternative; boundary="00000000000011e6a505f634d780"

--00000000000011e6a505f634d780
Content-Type: text/plain; charset="UTF-8"

Thank you, Lenny & Paul

Thank you & Regards
Anurag Aggarwal

--00000000000011e6a505f634d780
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr">Thank you, Lenny &amp; Paul</div><br><div class="gmail_quote"><div class="gmail_attr">Thank you &amp; Regards</div><div class="gmail_attr">Anurag Aggarwal</div></div></div>

--00000000000011e6a505f634d780--

--===============2168615581092515409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2168615581092515409==--

