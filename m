Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD3DB1F6954
	for <lists+linux-audit@lfdr.de>; Thu, 11 Jun 2020 15:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591883283;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nqHFObFb6Xyw1zFDxVSX3xj7xE3MnJlfYWH4LJ3Baj4=;
	b=L88YRweQUEtitD25efZW3rJRTQIH5tMwid0pj34VmL+FrdsFoAuE6ti2IW91is6toDG3qs
	N5iP2HWJBahEyF+NHZv47cQedUftEj20GPl+HUaFkW9yM4KZXd6SJrGMDKDzS8ZSTC9NaO
	5GDkch6UteHkMxE0kOkQyklc1JJnq/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-DWyaIoFOOomD0KFi33Zv3A-1; Thu, 11 Jun 2020 09:48:01 -0400
X-MC-Unique: DWyaIoFOOomD0KFi33Zv3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19EBC835B48;
	Thu, 11 Jun 2020 13:47:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4AF378931;
	Thu, 11 Jun 2020 13:47:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07DF01809547;
	Thu, 11 Jun 2020 13:47:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05B1wwZS007380 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 10 Jun 2020 21:58:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04D4010F1BFD; Thu, 11 Jun 2020 01:58:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 012E610F1BEE
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 01:58:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1651D186E3A1
	for <linux-audit@redhat.com>; Thu, 11 Jun 2020 01:58:56 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-436-08ddtNPLPumAcx1W-WOggg-1;
	Wed, 10 Jun 2020 21:58:51 -0400
X-MC-Unique: 08ddtNPLPumAcx1W-WOggg-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id A075F20B4778;
	Wed, 10 Jun 2020 18:58:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A075F20B4778
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
To: Paul Moore <paul@paul-moore.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<CAHC9VhTZb_evUcdygs6MHP73Bi_r3esxV6+Ko6VDpncfmLYEZw@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <5cc042be-a3cf-ae39-c4f5-e474d02c0613@linux.microsoft.com>
Date: Wed, 10 Jun 2020 18:58:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTZb_evUcdygs6MHP73Bi_r3esxV6+Ko6VDpncfmLYEZw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 11 Jun 2020 09:42:50 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/10/20 6:45 PM, Paul Moore wrote:

Hi Paul,

> I'm sorry I didn't get a chance to mention this before you posted this
> patch, but for the past several years we have been sticking with a
> policy of only adding new fields to the end of existing records;
> please adjust this patch accordingly.  Otherwise, this looks fine to
> me.
> 
>>          audit_log_untrustedstring(ab, get_task_comm(name, current));
>>          if (fname) {
>>                  audit_log_format(ab, " name=");
>> --

Steve mentioned that since this new field "errno" is not a searchable 
entry, it can be added anywhere in the audit log message.

But I have no problem moving this to the end of the audit record.

thanks,
  -lakshmi


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

