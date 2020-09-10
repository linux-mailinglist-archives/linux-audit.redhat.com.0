Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFEA2647C5
	for <lists+linux-audit@lfdr.de>; Thu, 10 Sep 2020 16:12:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-leIEmL5dPp-fsej07sh0cw-1; Thu, 10 Sep 2020 10:12:03 -0400
X-MC-Unique: leIEmL5dPp-fsej07sh0cw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 604872FD0C;
	Thu, 10 Sep 2020 14:11:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C3727C29;
	Thu, 10 Sep 2020 14:11:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77BDD922E8;
	Thu, 10 Sep 2020 14:11:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AEBYZf019880 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 10:11:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55147F5581; Thu, 10 Sep 2020 14:11:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5094EF5584
	for <linux-audit@redhat.com>; Thu, 10 Sep 2020 14:11:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23BD6811E78
	for <linux-audit@redhat.com>; Thu, 10 Sep 2020 14:11:31 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-130-C2mnyBFsMdKf2dmUWpqRsA-1; Thu, 10 Sep 2020 10:11:26 -0400
X-MC-Unique: C2mnyBFsMdKf2dmUWpqRsA-1
Received: by mail-ed1-f66.google.com with SMTP id c8so6471946edv.5
	for <linux-audit@redhat.com>; Thu, 10 Sep 2020 07:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JqER1n/S/bVapO+RyrM1xxWOQKbNzVguXbfv8iwgPWk=;
	b=af/XXAtv5/mZjtZjGeF5d8+xMhC+oouRwEaoOqrewHaxkHFpmQE6XxZ3Mc7GIK7DVL
	PJr7nn0WuUua/DYoHouHKiZndxetZEd18o8sDxkWCj75VoJnx5zHAmrSWhmpIK9w1R35
	9d1bv+OB5KvHaBraa0xmrtljFCsx02nOIH+ALz1JX55ETXt2Va/c4ClfY5jLNaF3URCs
	sss12KgLg/O9L8ndrjtbms0S4Vb013rjPTovGGRxG7demo9xgYh09Z9l95HVl1qozzOC
	mvITMBSGXy4mwk2NoeOnecTQlV4pX+eiYS61sk93wn+/KITa4CG79IeosJC4ZQY/ZCDt
	db+w==
X-Gm-Message-State: AOAM530BiX8ORSeN2mGFNtej6f2dIgxB8DTr/JehPLcOSCqn/9OiGzTt
	/BkXH3zvo2Nl9Jni3OzWmxioYE3Tbwx20Ki/SZ13
X-Google-Smtp-Source: ABdhPJy1FTJ7DXFJo05WoW+t4O9pZDdDoW4TpXiv609ezJYlL+41ua8D4GnLvm80oWsYted6RRcGfRiYYQPB685hrWg=
X-Received: by 2002:a05:6402:1805:: with SMTP id
	g5mr9107156edy.135.1599747084327; 
	Thu, 10 Sep 2020 07:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
	<1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
	<CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
	<ef6a049a-c6b9-370b-c521-4594aa73e403@schaufler-ca.com>
	<CAHC9VhSu4qqKWsutm3=GF_pihUKpwjAtc9gAhfjGsGtKfz-Azw@mail.gmail.com>
	<585600d7-70fb-0982-1e6b-ffd7b7c33e32@schaufler-ca.com>
	<9a58d14c-eaff-3acf-4689-925cf08ba406@canonical.com>
	<CAEjxPJ7i5Ruy=NZ+sq3qCm8ux+sZXY5+XX_zJu3+OqFq3d_SLQ@mail.gmail.com>
	<CAEjxPJ5KudgTjhmXBNdCO_ctvioy5UA5PXcoKX4zc19NYKgHZA@mail.gmail.com>
	<c5bef71e-6d78-2058-bcaa-8497c76d7375@schaufler-ca.com>
	<b320f0f6-02db-95a5-acc5-cadd5dbb57dc@canonical.com>
	<CAEjxPJ6wFJz935RR_1u+-EjAw3VMv4nabo-Za_OqkZGJuNS5Sg@mail.gmail.com>
	<b67799e2-fa22-2890-698d-f410913b0c8a@canonical.com>
In-Reply-To: <b67799e2-fa22-2890-698d-f410913b0c8a@canonical.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Sep 2020 10:11:13 -0400
Message-ID: <CAHC9VhRMubBNRNRKSLWrQw9nGZFX1G96+8EZzaG69OHWvZaJoQ@mail.gmail.com>
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: John Johansen <john.johansen@canonical.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
	Casey Schaufler <casey.schaufler@intel.com>,
	LSM List <linux-security-module@vger.kernel.org>,
	linux-audit@redhat.com, Stephen Smalley <sds@tycho.nsa.gov>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 9, 2020 at 2:47 PM John Johansen
<john.johansen@canonical.com> wrote:
> ... For now Casey can drop it from this series.

As long as that whenever it reappears there is at the very least some
note of the limits in the commit description and the code (via
comments in the struct).  Of course that assumes we can't find an
alternate solution that we can all agree on which doesn't have these
stacking limits.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

