Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BE2571F0443
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 04:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591411870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tfDZdIY/7KV7fPMfvLut9ULgLYOzcTIk3XPA4RkwhRU=;
	b=IFCixKnemFpK5BkM40JoG4gFIVIKpylt928cFyNlIsSE6fL2w+EwVk5SasmLrXdekr2VH4
	OEyGnE6S1F50PZO3Iou7bMp6TcAOEyB7jDx+Xf6pcQKH11iEVKM15Szc+D38JBZq+RPlOz
	++Lb806Wi7GoN4RpGPKyLUrVjo0Y/S8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-wT5mqw_DNH6Fh0EujuI07Q-1; Fri, 05 Jun 2020 22:51:04 -0400
X-MC-Unique: wT5mqw_DNH6Fh0EujuI07Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14B848018AB;
	Sat,  6 Jun 2020 02:50:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A2E1A925;
	Sat,  6 Jun 2020 02:50:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 141531809547;
	Sat,  6 Jun 2020 02:50:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055JxaM3005572 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 15:59:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1EA32026D67; Fri,  5 Jun 2020 19:59:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD1F2026FFE
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 19:59:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2ED3811E77
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 19:59:33 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-188-ZscDJmBjMriPEDTRImQ-jw-1;
	Fri, 05 Jun 2020 15:59:31 -0400
X-MC-Unique: ZscDJmBjMriPEDTRImQ-jw-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 260C920B7185;
	Fri,  5 Jun 2020 12:54:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 260C920B7185
Subject: Re: [PATCH] IMA: Add log statements for failure conditions
To: Paul Moore <paul@paul-moore.com>, Mimi Zohar <zohar@linux.ibm.com>
References: <20200604163243.2575-1-nramas@linux.microsoft.com>
	<1591382782.5816.36.camel@linux.ibm.com>
	<CAHC9VhS-EP=Kk3GKRzAGAYa5mqupkLQCHz_m_DgoAKRWcSTgLA@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <8dfb3fa6-5c1f-d644-7d21-72a9448c52cc@linux.microsoft.com>
Date: Fri, 5 Jun 2020 12:54:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS-EP=Kk3GKRzAGAYa5mqupkLQCHz_m_DgoAKRWcSTgLA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 22:50:43 -0400
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/5/20 12:37 PM, Paul Moore wrote:

> If it's audit related, it's generally best to CC the linux-audit list,
> not just me (fixed).
> 
> It's not clear to me what this pr_err() is trying to indicate other
> than *something* failed.  Can someone provide some more background on
> this message?

process_buffer_measurement() is currently used to measure
"kexec command line", "keys", and "blacklist-hash". If there was any 
error in the measurement, this pr_err() will indicate which of the above 
measurement failed and the related error code.

Please let me know if you need more info on this one.

Since a pr_xyz() call was already present, I just wanted to change the 
log level to keep the code change to the minimum. But if audit log is 
the right approach for this case, I'll update.

thanks,
  -lakshmi


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

