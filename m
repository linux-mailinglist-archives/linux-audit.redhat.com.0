Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 945DE1FFEF7
	for <lists+linux-audit@lfdr.de>; Fri, 19 Jun 2020 01:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592524520;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p7eKW8FKyi/rGJaiuQ+vCh3X9WN/PO/WeoEV8dLRgHU=;
	b=hqAUjZj0KRf0Ah2zkOoFKYZLz0kvoGdxR69vzYCN+r77lqhykaUeD5L3JvQtfxbxkk0Bcn
	vwBPXGE3LyZ2ygkyKZIFL1BS1dJCx/xkB0MSHT/8I+TekiGEJLTHEkBAiEY5n2EVneVV6T
	7CUDWw/vUbTXwZmTb+ysJX3QrrhMKOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-aXdNwWeYNo-nP2Ncxj_wpA-1; Thu, 18 Jun 2020 19:55:18 -0400
X-MC-Unique: aXdNwWeYNo-nP2Ncxj_wpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39EE8184D145;
	Thu, 18 Jun 2020 23:55:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1620A1002382;
	Thu, 18 Jun 2020 23:55:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21C8F1809547;
	Thu, 18 Jun 2020 23:55:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05INt6sc022439 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 19:55:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C95662156A3A; Thu, 18 Jun 2020 23:55:06 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C572156A2D
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 23:55:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5998C85A5A3
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 23:55:04 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-381-iTSf_YvMO3OhIjtQx6r8Tg-1; Thu, 18 Jun 2020 19:55:02 -0400
X-MC-Unique: iTSf_YvMO3OhIjtQx6r8Tg-1
Received: by mail-pf1-f172.google.com with SMTP id h185so3592745pfg.2
	for <linux-audit@redhat.com>; Thu, 18 Jun 2020 16:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PaL+jevcJp2RDsTR1+rLsDbpxcPfJ3UOiX+j5VbZoqg=;
	b=a69Kb/nwf5ulRts54xoHzDPpPUB88mhI9IxAX8FrdCc4hXci2KwIyr8DwLysS1wu8Q
	HBmjOdvZbVcLEOi4QmHMpq3i3IMKO0BJGVavjc0Y3FTrhK3Flw8gkjrELb2WBSc2Gz/q
	elI3KrzUCVKFupOSbexuAisvnWX2anRfnTJriZGpE775CfrSIF8/s1X2O384WlDjRSKP
	mImmDMkSdkNuwvEpPUSiZ/r3ng0+JYIZbuvMV20Fu03P5PHDuFq6iI7125nI97AOPk6h
	61jpf2K75CO5R3bozc9Fe+j73MQnIbcStnGmzNBv1UMr2GcF1qg0PEF6zmLiLL45DEem
	xR4Q==
X-Gm-Message-State: AOAM532Bj7ishUpITSllc9V/t1E/X8pLHRQYWCmef2u8XK1e+5FGJm3b
	Ec03o49G4aqZi+sR3gk57oKqpTOEjzU=
X-Google-Smtp-Source: ABdhPJxFgVBAw0WpMInnMQYpvZuhZkHfQr/v6CgWGR8/kjRDZok7bnm4SBeRXLKi7+ZWkbNbG1xlZg==
X-Received: by 2002:a63:725c:: with SMTP id c28mr812129pgn.156.1592524500765; 
	Thu, 18 Jun 2020 16:55:00 -0700 (PDT)
Received: from [192.168.0.143] ([216.158.248.173])
	by smtp.gmail.com with ESMTPSA id
	g19sm3827784pfo.209.2020.06.18.16.55.00 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 18 Jun 2020 16:55:00 -0700 (PDT)
Subject: Re: Error handling of auditctl -w
To: linux-audit@redhat.com
References: <1MXp9Y-1jOF6E24IW-00Y8HI@mail.gmx.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <c24d29b5-2f29-260c-956d-64863ca15ef9@magitekltd.com>
Date: Thu, 18 Jun 2020 17:54:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1MXp9Y-1jOF6E24IW-00Y8HI@mail.gmx.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
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

On 6/16/20 2:00 PM, Stefan Tauner wrote:

> Hi,
>
> I was wondering why my auditctl executions do not print any errors but
> apparently didn't do anything. After checking the return value (which
> was 255) I looked at the code and noticed that audit_setup_perms() and
> audit_update_watch_perms() have virtually no user-visible error reporting.

Are these in a rules file? I was thinking about perhaps a previous "-i" 
(i.e. auditctl -i) preceeded your rule, however the man page says it 
always returns a success code.

So probably not that, unless the man page doesn't match reality. Can you 
provide a little more detail (e.g. parameters)?

Thx,

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

