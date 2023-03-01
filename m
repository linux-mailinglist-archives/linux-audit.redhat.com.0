Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661F6A71CB
	for <lists+linux-audit@lfdr.de>; Wed,  1 Mar 2023 18:05:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677690332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jSPX+hWk+TI8Jx1sQsuUpKbtrm2gVLcRj516fWL7E5U=;
	b=OWWoq8ZlkSseeb7oUEbBb6GxF3tTCzaKlZ58kFSF4wOCG4JmOcprTTnWHuKm2dJItw6vQY
	pvcoQyAKDAPzEIkvWSliaryCGF/kDiBvNyriavOmjyi9haiu7LYzcrV/2fje5ETUTqClJJ
	QsitiQYNmJN4wNX2bSkTbV+I4b2RY40=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-qW3J-4g8MRWcpmj_Zqhs6Q-1; Wed, 01 Mar 2023 12:05:30 -0500
X-MC-Unique: qW3J-4g8MRWcpmj_Zqhs6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 499373C0E218;
	Wed,  1 Mar 2023 17:05:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 967DC2166B26;
	Wed,  1 Mar 2023 17:05:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 93E3C1946A46;
	Wed,  1 Mar 2023 17:05:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE6BB1946589 for <linux-audit@listman.corp.redhat.com>;
 Wed,  1 Mar 2023 17:05:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B461E400D79D; Wed,  1 Mar 2023 17:05:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD04A40C6EC4
 for <linux-audit@redhat.com>; Wed,  1 Mar 2023 17:05:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91713857F42
 for <linux-audit@redhat.com>; Wed,  1 Mar 2023 17:05:18 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-e8XDwVd3PZyRbAk3oz3whA-1; Wed, 01 Mar 2023 12:05:16 -0500
X-MC-Unique: e8XDwVd3PZyRbAk3oz3whA-1
Received: by mail-il1-f172.google.com with SMTP id g9so1135876ila.8
 for <linux-audit@redhat.com>; Wed, 01 Mar 2023 09:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677690316;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5ZfGmN1Hzkt0Tz+ZLU1L4dCs88xVxwRujEUWNvtdoWo=;
 b=zdCU4Fj2f4HoGr4nd6Zc4KhTdET8Mk+6BSVJ0Hr+hGqBwIPK2YxkoTsIZ8CQAVmyAZ
 dfS8L4cPpfbbg5GCVLHC9v5lIz6NvZBcblER85ExvNfzcAhAiJl0hxM7qsrOQpbHhFix
 2luzTqooY0MktzNjIaY/nY+R7+0dgJz5+5iwgmx9AulHw3H0+zVpFDc2yBKqhhFD8nqe
 f6nB/MDu1a0hx37kCAIcms9YgcCxc4juM4IyYb1P6Mv07eOfI0cX7VZpODbUfdeJak5I
 77PHaTtAC71Ig1bnvEhGarxFCyLwq2z6kVhaX3SEmk+lUuQ5OFKXIUqeidCoTil17W2t
 10wA==
X-Gm-Message-State: AO0yUKWBF/uKeGHiD+MeLwI4B9qyJyFDXRo7q6pSuTtBt9z5lY26nXXe
 rvEOqIHNI7Jl9qiLqUIfHQNnYcqnwrVKGX4LxvI=
X-Google-Smtp-Source: AK7set+T2K19DBuheylTnq2zMVGSSt7hdAmOy7R7Dr3FM4Tvkc2iCVgA5Oab7CxfQ2W/IsQKQ9cAHg==
X-Received: by 2002:a05:6e02:1cab:b0:315:56ab:1705 with SMTP id
 x11-20020a056e021cab00b0031556ab1705mr7383812ill.27.1677690315756; 
 Wed, 01 Mar 2023 09:05:15 -0800 (PST)
Received: from [192.168.0.143] ([206.85.149.8])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a92c743000000b00316d9faf726sm3702988ilp.37.2023.03.01.09.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 09:05:15 -0800 (PST)
Message-ID: <37a373df-97cd-133a-381f-6d6d4b20c3fa@magitekltd.com>
Date: Wed, 1 Mar 2023 10:05:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
 <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
 <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
 <CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
In-Reply-To: <CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============2940033909863387559=="

This is a multi-part message in MIME format.
--===============2940033909863387559==
Content-Type: multipart/alternative;
 boundary="------------De4p5EmcWIo06GuNRoi0ZkbU"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------De4p5EmcWIo06GuNRoi0ZkbU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/1/23 08:31, Anurag Aggarwal wrote:

>
>     What we do not know is - do you have any filtering criteria in
>     mind not
>     covered by the available auditctl exclusions or do you just want to
>     "sample" randomly?
>
>     If the latter, why bother auditing this with a rule at all? You
>     might be
>     able to remove the rule causing the events and do something in
>     userspace
>     to audit only what you really want.
>
>
> We want to sample system calls like rename.
> In many cases, we have seen this overburden and increase auditd cpu 
> consumption.
> In such cases, we want to drop some events randomly, so as to keep cpu 
> consumption under control.
>
> There are other rules also, for example monitoring login/logout.
> For such rules we do not want to drop any event.

OK; that makes sense.The concern is that when some of the events that 
can overflow (rename syscalls in this case) are flooding your auditd, 
the ones you care about (login/logout) could be dropped.

But _some_ renames are ok. Maybe you can decide which directories are OK 
to have renames under them and exclude those in your key rule? Or only 
watch for renames inside certain dirs?


Or if selinux is in force, create policy for the events you definitely 
want, then look for those types (either subject or object) in your rule. 
This is something I've seen before, where renames that are desired to be 
audited use the provided system tools, but for locally developed 
application code, they are made to run inside a certain type of a custom 
executable and then that type is excluded from the rename syscall rule. 
Ideally, the code which is written would self-audit a 1-liner like "I am 
going to rename every file under dir /opt/special/stuff/" using 
audit_log_user_message so you still have some idea what is happening (if 
you care).

Then your "my-rename" program subject type of my_rename_t can be used as 
an exclude on the rule. Of course, the caller must then know to use this 
rather than the standard utilities.


HTH,

LCB

-- 
Lenny Bruzenak
MagitekLTD

--------------De4p5EmcWIo06GuNRoi0ZkbU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 3/1/23 08:31, Anurag Aggarwal wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex"><br>
            What we do not know is - do you have any filtering criteria
            in mind not <br>
            covered by the available auditctl exclusions or do you just
            want to <br>
            "sample" randomly?<br>
            <br>
            If the latter, why bother auditing this with a rule at all?
            You might be <br>
            able to remove the rule causing the events and do something
            in userspace <br>
            to audit only what you really want.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>We want to sample system calls like rename.</div>
          <div>In many cases, we have seen this overburden and increase
            auditd cpu consumption.</div>
          <div>In such cases, we want to drop some events randomly, so
            as to keep cpu consumption under control.</div>
          <div><br>
          </div>
          <div>There are other rules also, for example monitoring
            login/logout. </div>
          <div>For such rules we do not want to drop any event.</div>
        </div>
      </div>
    </blockquote>
    <p>OK; that makes sense.The concern is that when some of the events
      that can overflow (rename syscalls in this case) are flooding your
      auditd, the ones you care about (login/logout) could be dropped.</p>
    <p>But _some_ renames are ok. Maybe you can decide which directories
      are OK to have renames under them and exclude those in your key
      rule? Or only watch for renames inside certain dirs?<br>
    </p>
    <p><br>
    </p>
    <p>Or if selinux is in force, create policy for the events you
      definitely want, then look for those types (either subject or
      object) in your rule. This is something I've seen before, where
      renames that are desired to be audited use the provided system
      tools, but for locally developed application code, they are made
      to run inside a certain type of a custom executable and then that
      type is excluded from the rename syscall rule. Ideally, the code
      which is written would self-audit a 1-liner like "I am going to
      rename every file under dir /opt/special/stuff/" using
      audit_log_user_message so you still have some idea what is
      happening (if you care).</p>
    <p>Then your "my-rename" program subject type of my_rename_t can be
      used as an exclude on the rule. Of course, the caller must then
      know to use this rather than the standard utilities.</p>
    <p><br>
    </p>
    <p>HTH,</p>
    <p>LCB<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------De4p5EmcWIo06GuNRoi0ZkbU--

--===============2940033909863387559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============2940033909863387559==--

