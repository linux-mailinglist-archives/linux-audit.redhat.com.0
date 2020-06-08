Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDAD1F2195
	for <lists+linux-audit@lfdr.de>; Mon,  8 Jun 2020 23:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591652757;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E4OcNkN9jRFwf3ijUv8y0DaS1rcgOGqE7QtXCCy+bwQ=;
	b=KjEq+YXhNAQH8pXb+Kc2/MjqxrB7cvMRpzM3Yf2PgwzR6PZU3KYMRHKh/fDrboCfexsKi3
	A+7pjB7u2QoOegsm6BDVN4OMAN5yFsz1bPfyjaENodUDcJz/wQ4GXHAHgnyVnQkXmqclxd
	LwnQZOKOce0rj9H/cHZ+OyB4oO4H0MU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-VbjrVezENlSBMiQUBWGt3A-1; Mon, 08 Jun 2020 17:45:52 -0400
X-MC-Unique: VbjrVezENlSBMiQUBWGt3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45421107ACCA;
	Mon,  8 Jun 2020 21:45:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A1F5C1C3;
	Mon,  8 Jun 2020 21:45:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A85151809547;
	Mon,  8 Jun 2020 21:45:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058LjMDl021479 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 17:45:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04E9C10D18D8; Mon,  8 Jun 2020 21:45:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E684C10D18D5
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 21:45:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6B35811768
	for <linux-audit@redhat.com>; Mon,  8 Jun 2020 21:45:19 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-313-6thYyUTZPg2BAr5Q4B0EqA-1; Mon, 08 Jun 2020 17:45:17 -0400
X-MC-Unique: 6thYyUTZPg2BAr5Q4B0EqA-1
Received: by mail-ej1-f68.google.com with SMTP id f7so20046434ejq.6
	for <linux-audit@redhat.com>; Mon, 08 Jun 2020 14:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Igh1IwPinYOHclngfiWXcdsSPSUfVMy900DjvDtZXdE=;
	b=ES6iwZe7LJwzkCs7VJqca4Q76lb8pUNKSijpHCPd5beNPvhYEYNt+k+/PLUHZPGF3Q
	MWIt9fGiTeOsPyn+WKLG5dRHTRuKhIu6RfsbX1EO+v2pnlYb2N8D8uENOC9FSYRy1AUK
	+BSA6HhuDwz7Wp2hf+oeBZ8vrUiDXtOb7zF7xDymx6t+e66AoQML2cTSdYX3HpT/97F+
	7kTjAAH1gkFcNIwRrxgCiqm8p4NHX4Yby/xGTGrmE6VPxbAmiDBD5oqYIhOw9uo+WHLV
	Qvi/VqGTbTWPrvHEdg2vNFJlO8Cz8atMQezn1K+zVAtf9vr5g6Lih/rT9hxhSpV5pcsv
	4fTg==
X-Gm-Message-State: AOAM532sD9btvfWbNfO4D7iBpBhU5rBFWGcgWqc/ucfVqNIjfG+p6MpH
	5IBk6UVRdBlZTG9cexIg0pzOnvGcDNoZ4DwRwZ22
X-Google-Smtp-Source: ABdhPJzM1blhuSfAtHWQKHod1napq/wyiCDkQzMZK14COSUGFvoq3xTJ7+bH9cmWhMvSg5A2bYc3wf0KPT0tdU0HpE0=
X-Received: by 2002:a17:906:2b81:: with SMTP id
	m1mr21816983ejg.488.1591652716065; 
	Mon, 08 Jun 2020 14:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200607221449.2837-1-nramas@linux.microsoft.com>
	<1591617171.4638.33.camel@linux.ibm.com>
In-Reply-To: <1591617171.4638.33.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 8 Jun 2020 17:45:05 -0400
Message-ID: <CAHC9VhQpK+Shy2b2tv+vrTS+a8+zZbsrRG=pjzoMK0LApJg1Sg@mail.gmail.com>
Subject: Re: [PATCH v2] IMA: Add audit log for failure conditions
To: Mimi Zohar <zohar@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 8, 2020 at 7:52 AM Mimi Zohar <zohar@linux.ibm.com> wrote:
> Hi Lakshmi,
>
> On Sun, 2020-06-07 at 15:14 -0700, Lakshmi Ramasubramanian wrote:
> > The final log statement in process_buffer_measurement() for failure
> > condition is at debug level. This does not log the message unless
> > the system log level is raised which would significantly increase
> > the messages in the system log. Change this log message to an audit
> > message for better triaging failures in the function.
> >
> > ima_alloc_key_entry() does not log a message for failure condition.
> > Add an audit message for failure condition in this function.
> >
> > Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>
> Audit messages should be at a higher level.  For example,
> "hashing_error", "collect_data", "invalid_pcr".  In the "invalid_pcr"
> case, the audit log contains the reason - "ToMToU" or "open_writers" -
> as to why the measurement list doesn't match the PCR.
>
> Here you would want "measuring_keys", "measuring_boot_cmdline" with
> the reason it failed, not the function name
> "process_buffer_measurement".
>
> Userspace needs to be aware of the new audit messages.  Maybe include
> samples of them in the cover letter.

Yes, examples of the audit record in the commit description (the cover
letter isn't recorded in the git log), are encouraged.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

