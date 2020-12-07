Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3843A2D19E4
	for <lists+linux-audit@lfdr.de>; Mon,  7 Dec 2020 20:43:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-DYg7IItgNlmHjcXqjZt0-A-1; Mon, 07 Dec 2020 14:43:50 -0500
X-MC-Unique: DYg7IItgNlmHjcXqjZt0-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D32E8049C0;
	Mon,  7 Dec 2020 19:43:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0068E5C1A1;
	Mon,  7 Dec 2020 19:43:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 613674E58E;
	Mon,  7 Dec 2020 19:43:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B7JhNf4016416 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 7 Dec 2020 14:43:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F40A80549; Mon,  7 Dec 2020 19:43:23 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8826449C38
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 19:43:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00CE3800140
	for <linux-audit@redhat.com>; Mon,  7 Dec 2020 19:43:21 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-565-fOgHV8vmNh-SOCMUemdIXg-1; Mon, 07 Dec 2020 14:43:17 -0500
X-MC-Unique: fOgHV8vmNh-SOCMUemdIXg-1
Received: by mail-il1-f193.google.com with SMTP id t9so9000513ilf.2
	for <linux-audit@redhat.com>; Mon, 07 Dec 2020 11:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=AGGMyWJfgni+7aB4gPtl/7pxlCXxnQVh33pk+pAIU6k=;
	b=EpwrVkfAymZ6Cq34SoUSWo/OzO7RKihtd5WFO+Qg5WdEhx+bfvcRv5weqB/Hh6dNN7
	WiJVOdvTWPqVIwcxbkz6cT1urIV9uhzmBmrk7ERpWjPnROz7rf8xjoWi9FWuarOZx7YT
	OTYuXcT/HGjSFfGVhQsh+rmDQbhpXfmvFt849Tozr4FpRBp7SjU4NO1tF9wKNOWKqSoZ
	nXscSc4zPGNVB3pBlQAb80vZh3bH1GIv732ah4xiTbeX0H4EhqkRYuooPFIIMR4QSCGc
	5m+hfKNWajnqtPowvoAsi6j0t75rdROU6YHvvfY8kf5UAYJkBrPs8Yn23gRenvO7cH2o
	Nyvg==
X-Gm-Message-State: AOAM53157rViyc/Q2LhhCtVG2+rf5N8v2ccQNZo8quVjJOboKQLPZcEX
	/WjmC2hrzvsb6MKOqO+3YGuRABp1Gb7LLYzj
X-Google-Smtp-Source: ABdhPJzV2dFPt/fe2cEmh5pmuDSiPG0PcMvgmyPvTk1atCYS57F5+l0rQ5Z8zlhOO0N97iHmj5iI4Q==
X-Received: by 2002:a92:358e:: with SMTP id c14mr22277227ilf.69.1607370195954; 
	Mon, 07 Dec 2020 11:43:15 -0800 (PST)
Received: from ?IPv6:2607:f768:200:b:ffff:ffff:ffff:edd8?
	([2607:f768:200:b:ffff:ffff:ffff:edd8])
	by smtp.gmail.com with ESMTPSA id c2sm4575982ila.71.2020.12.07.11.43.14
	for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 07 Dec 2020 11:43:15 -0800 (PST)
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: linux-audit@redhat.com
References: <20200701213244.GA1817@linux-kernel-dev>
	<CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <3fb7e274-c442-8025-ba27-bc27f445640a@magitekltd.com>
Date: Mon, 7 Dec 2020 12:43:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============6025767226831272681=="

This is a multi-part message in MIME format.
--===============6025767226831272681==
Content-Type: multipart/alternative;
	boundary="------------F9A0F5E0F5070A2268614FAC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F9A0F5E0F5070A2268614FAC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/20 2:42 PM, Paul Moore wrote:

>>   #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
>>   #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
>> @@ -348,6 +349,7 @@ enum {
>>   #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER  0x00000010
>>   #define AUDIT_FEATURE_BITMAP_LOST_RESET                0x00000020
>>   #define AUDIT_FEATURE_BITMAP_FILTER_FS         0x00000040
>> +#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM  0x00000080
> In an effort not to exhaust the feature bitmap too quickly, I've been
> restricting it to only those features that would cause breakage with
> userspace.  I haven't looked closely at Steve's userspace in quite a
> while, but I'm guessing it can key off the structure size and doesn't
> need this entry in the bitmap, right?  Let me rephrase, if userspace
> needs to key off anything, it*should*  key off the structure size and
> not a new flag in the bitmask;)
>
> Also, I'm assuming that older userspace doesn't blow-up if it sees the
> larger structure size?  That's even more important.
>
Paul,

This change does seem to the untrained eye to be in line with the 
existing FEATURE_BITMAP definitions. I appreciate your intent on not 
exhausting the available space, but at some point if that happens is 
there any reasonable way to expand? I'm sure you have some thoughts, or 
is this "it" as far as features could go (the last available bits)?

Max,

It's a pretty good feature. I agree with your original problem 
assessment; this is an area I'm always looking at. I've got questions 
I'll post separately as they are not germane to this thread.


As an interested user I'm hoping for a resolution on this, so that the 
userspace release can happen, as this seems to be a beneficial change 
which I could make use of when available.


Thx,

LCB


-- 
Lenny Bruzenak
MagitekLTD


--------------F9A0F5E0F5070A2268614FAC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 7/2/20 2:42 PM, Paul Moore wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CAHC9VhTctHCCrm4Q1cPdFX-6NXEtmjEPmw6rvUoxOq8UUmycxA@mail.gmail.com">
      <blockquote type="cite" style="font-size: large; color: #000000;">
        <pre class="moz-quote-pre" wrap=""> #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT     0x00000001
 #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME 0x00000002
@@ -348,6 +349,7 @@ enum {
 #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER  0x00000010
 #define AUDIT_FEATURE_BITMAP_LOST_RESET                0x00000020
 #define AUDIT_FEATURE_BITMAP_FILTER_FS         0x00000040
+#define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_SUM  0x00000080
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">In an effort not to exhaust the feature bitmap too quickly, I've been
restricting it to only those features that would cause breakage with
userspace.  I haven't looked closely at Steve's userspace in quite a
while, but I'm guessing it can key off the structure size and doesn't
need this entry in the bitmap, right?  Let me rephrase, if userspace
needs to key off anything, it <b class="moz-txt-star"><span class="moz-txt-tag">*</span>should<span class="moz-txt-tag">*</span></b> key off the structure size and
not a new flag in the bitmask <span class="moz-smiley-s3" title=";)"><span>;)</span></span>

Also, I'm assuming that older userspace doesn't blow-up if it sees the
larger structure size?  That's even more important.

</pre>
    </blockquote>
    <p>Paul, <br>
    </p>
    <p>This change does seem to the untrained eye to be in line with the
      existing FEATURE_BITMAP definitions. I appreciate your intent on
      not exhausting the available space, but at some point if that
      happens is there any reasonable way to expand? I'm sure you have
      some thoughts, or is this "it" as far as features could go (the
      last available bits)?<br>
    </p>
    <p>Max,</p>
    <p>It's a pretty good feature. I agree with your original problem
      assessment; this is an area I'm always looking at. I've got
      questions I'll post separately as they are not germane to this
      thread.</p>
    <p><br>
    </p>
    <p>As an interested user I'm hoping for a resolution on this, so
      that the userspace release can happen, as this seems to be a
      beneficial change which I could make use of when available.<br>
    </p>
    <p><br>
    </p>
    <p>Thx,</p>
    <p>LCB</p>
    <br>
    <pre class="moz-signature" cols="72">-- 
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------F9A0F5E0F5070A2268614FAC--

--===============6025767226831272681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============6025767226831272681==--

