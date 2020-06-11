Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A1AC61F5FED
	for <lists+linux-audit@lfdr.de>; Thu, 11 Jun 2020 04:19:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591841988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v3Udi6LQtUcOUSIadHQXUxJxHfBdiMuXgDS++dN7T/s=;
	b=hMlVaG39Cw5Op4RMg+9t/48olc+6YFWfBkBGmSEjutnH79dUxg8g5K8UbTJrpdjmfIz0S1
	qTK9a67o+vKuwWaUzyIwLWAAKLvXUjNVJz0c90j7v0eVYYHdNK9rgx5/qKSjhXTMQkQfeN
	1+D3UHcLsBEzLrAwGRsZxL6sOCalpBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-keM9GqXLP_m5m3lYxDBhsg-1; Wed, 10 Jun 2020 22:19:45 -0400
X-MC-Unique: keM9GqXLP_m5m3lYxDBhsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB2B01883602;
	Thu, 11 Jun 2020 02:19:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEFAB60BE2;
	Thu, 11 Jun 2020 02:19:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F28F1809547;
	Thu, 11 Jun 2020 02:19:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05B2JQgF009849 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Jun 2020 22:19:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A902810CB277; Thu, 11 Jun 2020 02:19:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4A1910CB276
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 02:19:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 979851859163
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 02:19:24 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-130-2LKizfYZNmuirCTkBXR5fA-1; Wed, 10 Jun 2020 22:19:22 -0400
X-MC-Unique: 2LKizfYZNmuirCTkBXR5fA-1
Received: by mail-ed1-f66.google.com with SMTP id t21so2809573edr.12
	for <linux-audit@redhat.com>; Wed, 10 Jun 2020 19:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YLqWW0R38/Z8PvUhsNci04vzswKiWQOvW+gGqv0nQGo=;
	b=rukeDU7QZ6GZAyHrMSWRddMQ8grJDbvPHfiX3rKxY8k1hwX83boys1vnB3czfrT16c
	e0VoEoKiaiCk/+KmchuTuXLnfuNZkzBl6N8P4TBV5DyRA6p7bFHdEUaWI2ZgaZUME7Nz
	uDAee8BkXa5fM76Gtj3AwoXQZoTl4y+7XE03la8TngeFQjR3y+cwh+SqxB1ji1zMseoZ
	K7S2vemQJhOgPkuZe8fO61ovkz9amLojW/hkU5Ylv4b2+q1xL6FHpkw1M3T4bbsjlirE
	e/mBZMOKb7dNzYGYs1MSBM45YBKK5RCPAwvwvuAHV44Q0NL8UwhI6J5KU54VJv/IkcyB
	famg==
X-Gm-Message-State: AOAM5303kneGY5RK2c+h3fg233VR5a8d26l4VS8wP4ML1G2Z+4ib+Mrf
	YNOoiPxODXTYxEmPZhpYr5o23drXS/2Jmno3K8LF
X-Google-Smtp-Source: ABdhPJx4K3nSbSZ4Yqt038h06TxmyoVYplISHIXhvrr/n3PL3cOiKIIx0iPc+IzcO+GSCsswHksOCSDbxryz5RDEjVg=
X-Received: by 2002:a05:6402:3ca:: with SMTP id
	t10mr5177275edw.128.1591841961040; 
	Wed, 10 Jun 2020 19:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<CAHC9VhTZb_evUcdygs6MHP73Bi_r3esxV6+Ko6VDpncfmLYEZw@mail.gmail.com>
	<5cc042be-a3cf-ae39-c4f5-e474d02c0613@linux.microsoft.com>
In-Reply-To: <5cc042be-a3cf-ae39-c4f5-e474d02c0613@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 10 Jun 2020 22:19:10 -0400
Message-ID: <CAHC9VhRAc3oCUhZmwbup6ivN3A_AMiBDxgjME_Ly75qY_doLVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 10, 2020 at 9:58 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
> On 6/10/20 6:45 PM, Paul Moore wrote:
>
> Hi Paul,
>
> > I'm sorry I didn't get a chance to mention this before you posted this
> > patch, but for the past several years we have been sticking with a
> > policy of only adding new fields to the end of existing records;
> > please adjust this patch accordingly.  Otherwise, this looks fine to
> > me.
> >
> >>          audit_log_untrustedstring(ab, get_task_comm(name, current));
> >>          if (fname) {
> >>                  audit_log_format(ab, " name=");
> >> --
>
> Steve mentioned that since this new field "errno" is not a searchable
> entry, it can be added anywhere in the audit log message.

Steve and I have a different opinion on this issue.  I won't rehash
the long argument or drag you into it, but I will just say that the
*kernel* has had a policy of only adding fields to the end of existing
records unless under extreme cases (this is not an extreme case).

> But I have no problem moving this to the end of the audit record.

Great, please do that.  Thank you.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

