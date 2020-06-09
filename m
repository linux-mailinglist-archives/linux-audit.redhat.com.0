Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C08B31F466F
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 20:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591728080;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5AXexP0HmKGeBlMg31fb2wx5xBRP+wcHp2tHUfs9c7o=;
	b=G8b6l1Qjp0qSOfPl+fMRP/nQYss7P4AyJwqXa/0iHPU5JPvV9tsH1folxxzkhlNKy/7dWH
	rU1hOmJW3AshSVQlFF/gV++PIFIPT/TFhykDXGcGsku+cOgyI4E7DggoUZaLZi+8X4EWgS
	AmtHK/7NFI+qW7Z3KSKcP7+EKtFr10A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-4evDWRz5MmeP1_QnwjMLLw-1; Tue, 09 Jun 2020 14:41:18 -0400
X-MC-Unique: 4evDWRz5MmeP1_QnwjMLLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5FF835B41;
	Tue,  9 Jun 2020 18:41:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE7F1001281;
	Tue,  9 Jun 2020 18:41:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD95E1809554;
	Tue,  9 Jun 2020 18:41:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059I3eS3003684 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 14:03:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9AB1FDEEC2; Tue,  9 Jun 2020 18:03:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9659FE38D8
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 18:03:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17A968007A4
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 18:03:37 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-328-fyvZU_xqPoKNqC3Jl-d-tQ-1;
	Tue, 09 Jun 2020 14:03:30 -0400
X-MC-Unique: fyvZU_xqPoKNqC3Jl-d-tQ-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1AE4320B717B;
	Tue,  9 Jun 2020 11:03:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1AE4320B717B
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
To: Steve Grubb <sgrubb@redhat.com>, Richard Guy Briggs <rgb@redhat.com>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
	<518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
	<20200609171555.itbllvtgjdanbbk7@madcap2.tricolour.ca>
	<2006844.2enhIMKrvE@x2>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <2e3bc793-0d29-5434-1da3-2bcc34ed9012@linux.microsoft.com>
Date: Tue, 9 Jun 2020 11:03:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2006844.2enhIMKrvE@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jun 2020 14:41:00 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, zohar@linux.ibm.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/9/20 10:35 AM, Steve Grubb wrote:
>>
>> If it is added, it should be appended to the end of the record since it
>> is an existing record format, then in the case of res=1, errno= should
>> still be present (not swing in and out) and just contain zero.  (Or
>> another value if there is a non-fatal warning?)
> 
> This is not a searchable field, so it can go anywhere. If it is searchable,
> ausearch expects ordering of other searchable fields.
> 

Thank you for the clarification Steve.

I'll add "errno=" right after "cause=".

Also, "errno" will always be present - will be set to 0 if status is 
"success" (res=1) and a non-zero value for failure (res=0)

thanks,
  -lakshmi


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

