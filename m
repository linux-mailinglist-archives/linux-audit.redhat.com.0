Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F3210E1
	for <lists+linux-audit@lfdr.de>; Fri, 17 May 2019 01:02:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FF1A307D913;
	Thu, 16 May 2019 23:01:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB3179418;
	Thu, 16 May 2019 23:01:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7DC71806B11;
	Thu, 16 May 2019 23:01:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GN0wli031669 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 19:00:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 797FE9CD8; Thu, 16 May 2019 23:00:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73BC0605D0
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 23:00:55 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16A6EC062ECD
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 23:00:47 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id z3so2273501pgp.8
	for <Linux-audit@redhat.com>; Thu, 16 May 2019 16:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=magitekltd-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=157m6VzZ59UtPRjw0hdwt9HMQVJ+Um8L4NH5UZPy81o=;
	b=Lr9kW8v83IaZHqjGJmF1TGcXnlDhwW9EUQ2MD4fR17zSqVhwWZoL+Jigg07ELLbUU1
	wwcYvFWL7SHwo8rXb8Iyg6Kh+oKqJHEEHxZF2V14pDEDmgQZebrEx9GC+3Z3wT4E4bva
	66vO6vrk24L1RhplOgHi9jkl8/BsQQqTtF0jPwm37UurZqpzFFfdtq6EhcKvr9mJasFZ
	odeJNIZUR8F/T+jDqAM6x7o3WFhIC6Nbncpgaz1UXIzw/woDVFK/SJc29TCnIp4OLXZD
	rCFbnXvN6xj5aqLSa+lgBTb69xi5ayd+uzsonLn7jN1adWQu4R+mFP3Ba5wlE8aGDx02
	Y11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=157m6VzZ59UtPRjw0hdwt9HMQVJ+Um8L4NH5UZPy81o=;
	b=AqIe2IeJ2aoCb8KoP8ugykDaEgi539+ZhlPxxOoBoyjeof5vXSA2EMlN307FbW2F2U
	sCMIk7XW/v6hYnSINLTmujCAwPxc4TC1tF+MgJArXG/T6mIdQP2LqnFoGzBjOPKHP4kY
	z5QRUTbHw8aKOjXm5I5kAWEF8uW2/TSyMDKGzVZzF2B/cehP/U0JWoxsQbvLBH3n7ESW
	MQRCkKNKfiL6AKq5xr+229JchQ63Pb08Jr9Z0IJlZl3GcXLIo4OKholbce+Z9SPXwcR9
	S6ZTj/r+weFVscsmFbundV3b/7ndolne0a7CySAOJhBfZBmHc64GF3cuAD1oqXqSizXq
	by+w==
X-Gm-Message-State: APjAAAVJhUSieym4jXYPuuto1jnwygAHhNwscc9lU78FKbh6EUpasJXR
	NVwUaP3TAkZlqVDbqUMD2C5qalmsgi8=
X-Google-Smtp-Source: APXvYqzp+3CRTaQmlxLTv00tL9RYQaO73z9AJ38X/pgpby08BZO4bKBFCapKopx62/xC3H/70hRiTg==
X-Received: by 2002:a62:2fc6:: with SMTP id
	v189mr19769541pfv.136.1558047641275; 
	Thu, 16 May 2019 16:00:41 -0700 (PDT)
Received: from [192.168.1.22]
	(47-220-175-246.pfvlcmta01.res.dyn.suddenlink.net. [47.220.175.246])
	by smtp.gmail.com with ESMTPSA id
	194sm13027303pfb.125.2019.05.16.16.00.40 for <Linux-audit@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 16:00:40 -0700 (PDT)
To: "Linux-audit@redhat.com" <Linux-audit@redhat.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Subject: useradd question
Message-ID: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
Date: Thu, 16 May 2019 18:00:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 16 May 2019 23:00:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 16 May 2019 23:00:48 +0000 (UTC) for IP:'209.85.215.182'
	DOMAIN:'mail-pg1-f182.google.com'
	HELO:'mail-pg1-f182.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: -0.01  (DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_NONE) 209.85.215.182
	mail-pg1-f182.google.com 209.85.215.182
	mail-pg1-f182.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 16 May 2019 23:02:16 +0000 (UTC)

If I add a new user with the "useradd" utility, it submits a ADD_USER
event, but the event itself has no interpretation for the new UID.

IOW, the "id" field is numeric and the translated data at the end of the
raw record has "ID=unknown(number)".

I'm guessing it is because until the user data has been successfully
entered, there is no translation. Perhaps the event submission should
wait until that happens?

I may be able to dig out the name from other related generated events,
but that is kind of a pain.

audit-2.8.5, RHEL 7.6

Thx,

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
