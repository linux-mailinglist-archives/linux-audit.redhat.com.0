Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 17302214628
	for <lists+linux-audit@lfdr.de>; Sat,  4 Jul 2020 15:36:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-X0yE80xwODCm2aIMVWGW9w-1; Sat, 04 Jul 2020 09:36:47 -0400
X-MC-Unique: X0yE80xwODCm2aIMVWGW9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E83D3107ACCD;
	Sat,  4 Jul 2020 13:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AF3E5C1BD;
	Sat,  4 Jul 2020 13:36:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76EE21809547;
	Sat,  4 Jul 2020 13:36:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 064DUiTN032097 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 4 Jul 2020 09:30:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E3257207B428; Sat,  4 Jul 2020 13:30:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6A86207B426
	for <linux-audit@redhat.com>; Sat,  4 Jul 2020 13:30:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E193C8007A4
	for <linux-audit@redhat.com>; Sat,  4 Jul 2020 13:30:40 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-UOEnoRhnO2qaM2bpBnORaA-1; Sat, 04 Jul 2020 09:30:38 -0400
X-MC-Unique: UOEnoRhnO2qaM2bpBnORaA-1
Received: by mail-ed1-f68.google.com with SMTP id b15so30295471edy.7
	for <linux-audit@redhat.com>; Sat, 04 Jul 2020 06:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lYXNB8sAYPR03z+7yXMvQjkDEkew3CoGHxaB14N9l3o=;
	b=i50NIVD45QaPHlEDY0twXdKQLR7U/l18kQfD2cC1/jUuOzPhUvDdfUiVX9vNc/Wpd+
	Bslif0OkliiNtzqW74J+bxD1XXwDuAPHR12Vcd3s/pgNBsp3SXLuEYQNQxfZmxdraA5s
	CztF/ZXdYW1YqcYw/0976aMTaDYoAxv0rrDkGOQspTT54SVkke29n+IlMNGGGlV4bEIA
	r5WpUKM0kcdw8RlOZEBjFMgExj9QoP4UpTmFxTT+dGdO1hhj4UJXxXMxLvVbB5HVLjAt
	ALKDudM/RP5uAGhDC2mIkdOOoaYYl6BMlwjvgYJJ9BvMu1DcBrm1AFFtn+FXmFeghpD6
	mhLw==
X-Gm-Message-State: AOAM531N6ujMGvrf41ecGlWYDBzxao3twmXCcc36hsxBBDIB6JjSMVS1
	3w3HA2iG0O4lB9yVrw9z4SXsdWKKLCJ8oVhOALD7
X-Google-Smtp-Source: ABdhPJxXnEAomjGOTfVoMxiJBSuMBpETmOS+i8zhHtjzsBKGVLhQISOvjpbb5e1kLK73pS32uCKmaU1565rkftQCo+o=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr44774064edr.164.1593869437418;
	Sat, 04 Jul 2020 06:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<e5a1ab6955c565743372b392a93f7d1ac98478a2.1593198710.git.rgb@redhat.com>
	<CAHC9VhTcFrPDSmvBBXevo-atCnxy4WK2YQ0WOeg4M1Sfz0qPgA@mail.gmail.com>
In-Reply-To: <CAHC9VhTcFrPDSmvBBXevo-atCnxy4WK2YQ0WOeg4M1Sfz0qPgA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 4 Jul 2020 09:30:26 -0400
Message-ID: <CAHC9VhTW+pTES3g7gOoCWT3tXG3NsP0KjDLLyBHs_i3HSQMspQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 02/13] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 4, 2020 at 9:29 AM Paul Moore <paul@paul-moore.com> wrote:
> On Sat, Jun 27, 2020 at 9:22 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Implement the proc fs write to set the audit container identifier of a
> > process, emitting an AUDIT_CONTAINER_OP record to document the event.

Sorry about the email misfire, you can safely ignore that last empty message.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

